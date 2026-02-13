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
    //Gera um id para a conversa com base no id de quem esta enviando e quem esta recebendo
    final convoId = _conversationIdFor(myUid, otherUid);
    final convoPath = 'conversations/$convoId';

    //Verifica se já existe uma conversa com esse ID, se ja existir, retorna ele
    final existing = await _cloud.getDoc(path: convoPath);
    if (existing != null) return convoId;

    final now = DateTime.now();

    //Crie um documento base da conversa que ainda nao existe
    final convoDoc = ConversationDocumentModel(
      id: convoId,
      participants: [myUid, otherUid],
      createdAt: now,
      lastMessage: '',
      lastMessageAt: now,
      lastSenderId: '',
    );

    //Grava o documento base (mas NÃO cria os inboxes ainda)
    await _cloud.setDoc(path: convoPath, data: convoDoc.toMap(), merge: false);

    return convoId;
  }

  //Esse método é responsável por criar a stream que vai ficar lendo quando tiver alterações no path de conversas do usuario
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

  //Esse método é responsavel por criar a Stream que vai ficar lendo as alterações nas mensagens de cada conversa
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

    // Busca os nomes dos usuários automaticamente
    String myName = '';
    String otherName = '';

    try {
      final myUserDoc = await _cloud.getDoc(path: 'users/$myUid');
      myName = myUserDoc?['name'] ?? '';

      final otherUserDoc = await _cloud.getDoc(path: 'users/$otherUid');
      otherName = otherUserDoc?['name'] ?? '';
    } catch (e) {
      // Se falhar, continua com strings vazias
    }

    // 1) Cria a mensagem para o meu usuario
    await _cloud.setDoc(
      path: 'users/$myUid/conversations/$conversationId/messages/$idMessage',
      data: UserMessageDocumentModel(
        id: idMessage,
        senderId: myUid,
        text: trimmed,
        sentAt: now,
      ).toMap(),
    );

    // 2) Cria a mesma mensagem pro usuário que estou enviando
    await _cloud.setDoc(
      path: 'users/$otherUid/conversations/$conversationId/messages/$idMessage',
      data: UserMessageDocumentModel(
        id: idMessage,
        senderId: myUid,
        text: trimmed,
        sentAt: now,
      ).toMap(),
    );

    // 3) atualiza metadados da conversa principal
    await _cloud.setDoc(
      path: 'conversations/$conversationId',
      data: {
        'lastMessage': trimmed,
        'lastMessageAt': now,
        'lastSenderId': myUid,
      },
      merge: true,
    );

    // 4) Cria/atualiza o inbox do meu usuário
    await _cloud.setDoc(
      path: 'users/$myUid/conversations/$conversationId',
      data: {
        'conversationId': conversationId,
        'otherUserId': otherUid,
        'otherUserName': otherName,
        'lastMessage': trimmed,
        'lastMessageAt': now,
      },
      merge: true,
    );

    // 5) Cria/atualiza o inbox do outro usuário
    await _cloud.setDoc(
      path: 'users/$otherUid/conversations/$conversationId',
      data: {
        'conversationId': conversationId,
        'otherUserId': myUid,
        'otherUserName': myName,
        'lastMessage': trimmed,
        'lastMessageAt': now,
      },
      merge: true,
    );
  }

  @override
  Future<void> deleteConversation({
    required String myUid,
    required String conversationId,
  }) async {
    // Apaga apenas o documento de inbox do usuário
    // A conversa principal em 'conversations/$conversationId' continua existindo
    // As mensagens em 'users/$myUid/conversations/$conversationId/messages/' também são apagadas

    final conversationPath = "users/$myUid/conversations/$conversationId";

    // 1) Apaga todas as mensagens da subcoleção
    final messagesPath = "$conversationPath/messages";
    await _cloud.deleteDoc(path: messagesPath);

    // 2) Apaga o documento da conversa do inbox do usuário
    await _cloud.deleteDoc(path: conversationPath);
  }
}
