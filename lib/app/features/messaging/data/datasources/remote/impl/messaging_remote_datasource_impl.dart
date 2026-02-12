import 'package:chaty_app/app/core/clients/cloud/cloud_client.dart';
import 'package:chaty_app/app/features/messaging/data/datasources/remote/contracts/messaging_remote_datasource.dart';
import 'package:chaty_app/app/features/messaging/data/models/conversation_document_model.dart';
import 'package:chaty_app/app/features/messaging/data/models/message_document_model.dart';
import 'package:chaty_app/app/features/messaging/data/models/user_conversation_document_model.dart';

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

    //Crie um documento base da conversa que ainda nao exise
    final convoDoc = ConversationDocumentModel(
      id: convoId,
      participants: [myUid, otherUid],
      createdAt: now,
      lastMessage: '',
      lastMessageAt: now,
      lastSenderId: '',
    );

    //Grava o documento base
    await _cloud.setDoc(
      path: convoPath,
      data: convoDoc.toMap(),
      merge: false,
    );

    //Espelha o documento da conversa para ambos os usuarios trocando os ids das propiedades
    final myInbox = UserConversationDocumentModel(
      id: convoId,
      conversationId: convoId,
      otherUserId: otherUid,
      otherUserName: otherName,
      lastMessage: '',
      lastMessageAt: now,
    );

    final otherInbox = UserConversationDocumentModel(
      id: convoId,
      conversationId: convoId,
      otherUserId: myUid,
      otherUserName: myName,
      lastMessage: '',
      lastMessageAt: now,
    );

    //Salva pra quem esta enviando
    await _cloud.setDoc(
      path: 'users/$myUid/conversations/$convoId',
      data: myInbox.toMap(),
      merge: true,
    );

    //Salva pra quem ta recebendo
    await _cloud.setDoc(
      path: 'users/$otherUid/conversations/$convoId',
      data: otherInbox.toMap(),
      merge: true,
    );

    return convoId;
  }


  //Esse método é responsável por criar a stream que vai ficar lendo quando tiver alterações no path de conversas do usuario
  @override
  Stream<List<UserConversationDocumentModel>> watchUserConversations({
    required String userId,
    int limit = 50,
  }) {
    return _cloud
        .collectionStream(
          collectionPath: 'users/$userId/conversations',
          orderByField: 'lastMessageAt',
          descending: true,
          limit: limit,
        )
        .map((docs) => docs
            .map((d) => UserConversationDocumentModel.fromMap(d.id, d.data))
            .toList());
  }

  //Esse método é responsavel por criar a Stream que vai ficar lendo as alterações nas mensagens de cada conversa
  @override
  Stream<List<MessageDocumentModel>> watchMessages({
    required String conversationId,
    int limit = 50,
  }) {
    return _cloud
        .collectionStream(
          collectionPath: 'conversations/$conversationId/messages',
          orderByField: 'sentAt',
          descending: true, 
          limit: limit,
        )
        .map((docs) => docs
            .map((d) => MessageDocumentModel.fromMap(d.id, d.data))
            .toList());
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

    // 1) cria a mensagem com id automático
    await _cloud.addDoc(
      collectionPath: 'conversations/$conversationId/messages',
      data: MessageDocumentModel(
        id: '', // id vem do Firestore (auto)
        senderId: myUid,
        text: trimmed,
        sentAt: now,
      ).toMap(),
    );

    // 2) atualiza metadados da conversa
    await _cloud.setDoc(
      path: 'conversations/$conversationId',
      data: {
        'lastMessage': trimmed,
        'lastMessageAt': now,
        'lastSenderId': myUid,
      },
      merge: true,
    );

    // 3) atualiza inbox (espelho) dos dois
    await _cloud.setDoc(
      path: 'users/$myUid/conversations/$conversationId',
      data: {
        'lastMessage': trimmed,
        'lastMessageAt': now,
      },
      merge: true,
    );

    await _cloud.setDoc(
      path: 'users/$otherUid/conversations/$conversationId',
      data: {
        'lastMessage': trimmed,
        'lastMessageAt': now,
      },
      merge: true,
    );
  }
}
