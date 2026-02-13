import 'package:chaty_app/app/core/clients/cloud/cloud_client.dart';
import 'package:chaty_app/app/features/messaging/data/datasources/remote/contracts/messaging_remote_datasource.dart';
import 'package:chaty_app/app/features/messaging/data/models/conversation_document_model.dart';
import 'package:chaty_app/app/features/messaging/data/models/message_document_model.dart';
import 'package:chaty_app/app/features/messaging/data/models/user_conversation_document_model.dart';
import 'package:chaty_app/app/features/messaging/data/models/user_message_document_model.dart';

class MessagingRemoteDatasourceImpl implements MessagingRemoteDatasource {
  final CloudClient _cloud;

  MessagingRemoteDatasourceImpl(this._cloud);

  String _conversationIdFor(String uid1, String uid2) {
    final pair = [uid1, uid2]..sort();
    return '${pair[0]}_${pair[1]}';
  }

  @override
  Future<String> getOrCreateConversation({
    required String myUid,
    required String otherUid,
    required String myName,
    required String otherName,
  }) async {
    final convoId = _conversationIdFor(myUid, otherUid);
    final convoPath = 'conversations/$convoId';

    final existing = await _cloud.getDoc(path: convoPath);
    if (existing != null) return convoId;

    final now = DateTime.now();

    // Cria o documento base
    final convoDoc = ConversationDocumentModel(
      id: convoId,
      participants: [myUid, otherUid],
      createdAt: now,
      lastMessage: '',
      lastMessageAt: now,
      lastSenderId: '',
    );

    await _cloud.setDoc(path: convoPath, data: convoDoc.toMap(), merge: false);
    return convoId;
  }

  @override
  Stream<List<UserConversationDocumentModel>> watchUserConversations({
    required String myUid,
    int limit = 50,
  }) {
    return _cloud
        .collectionStream(
          collectionPath: 'users/$myUid/conversations',
          orderByField: 'lastMessageAt',
          descending: true,
          limit: limit,
        )
        .map(
          (docs) => docs
              .map((d) => UserConversationDocumentModel.fromMap(d.id, d.data))
              .toList(),
        );
  }

  @override
  Stream<List<MessageDocumentModel>> watchMessages({
    required String myUid,
    required String conversationId,
    int limit = 50,
  }) {
    return _cloud
        .collectionStream(
          collectionPath:
              'users/$myUid/conversations/$conversationId/messages/',
          orderByField: 'sentAt',
          descending: true,
          limit: limit,
        )
        .map(
          (docs) => docs
              .map((d) => MessageDocumentModel.fromMap(d.id, d.data))
              .toList(),
        );
  }

  @override
  Future<void> sendMessage({
    required String conversationId,
    required String myUid,
    required String otherUid,
    required String text,
  }) async {
    final now = DateTime.now();
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    final idMessage = _cloud.generateIdMessage(myUid: myUid);
    final namesFuture = Future.wait([
      _cloud.getDoc(path: 'users/$myUid'),
      _cloud.getDoc(path: 'users/$otherUid'),
    ]);

    final results = await namesFuture.catchError((_) => [null, null]);
    final myName = results[0]?['name'] ?? '';
    final otherName = results[1]?['name'] ?? '';

    // Prepara os dados da mensagem
    final messageData = UserMessageDocumentModel(
      id: idMessage,
      senderId: myUid,
      text: trimmed,
      sentAt: now,
    ).toMap();

    await Future.wait([
      _cloud.setDoc(
        path: 'users/$myUid/conversations/$conversationId/messages/$idMessage',
        data: messageData,
      ),
      _cloud.setDoc(
        path:
            'users/$otherUid/conversations/$conversationId/messages/$idMessage',
        data: messageData,
      ),

      _cloud.setDoc(
        path: 'conversations/$conversationId',
        data: {
          'lastMessage': trimmed,
          'lastMessageAt': now,
          'lastSenderId': myUid,
        },
        merge: true,
      ),

      // Inbox do meu usuário
      _cloud.setDoc(
        path: 'users/$myUid/conversations/$conversationId',
        data: {
          'conversationId': conversationId,
          'otherUserId': otherUid,
          'otherUserName': otherName,
          'lastMessage': trimmed,
          'lastMessageAt': now,
        },
        merge: true,
      ),

      // Inbox do outro usuário
      _cloud.setDoc(
        path: 'users/$otherUid/conversations/$conversationId',
        data: {
          'conversationId': conversationId,
          'otherUserId': myUid,
          'otherUserName': myName,
          'lastMessage': trimmed,
          'lastMessageAt': now,
        },
        merge: true,
      ),
    ]);
  }

  @override
  Future<void> deleteConversation({
    required String myUid,
    required String conversationId,
  }) async {
    // Deleta apenas o documento da conversa
    await _cloud.deleteDoc(path: 'users/$myUid/conversations/$conversationId');
  }
}
