import 'package:chaty_app/app/features/messaging/data/datasources/remote/contracts/messaging_remote_datasource.dart';
import 'package:chaty_app/app/features/messaging/data/models/message_document_model.dart';
import 'package:chaty_app/app/features/messaging/data/models/user_conversation_document_model.dart';
import 'package:chaty_app/app/features/messaging/domain/entities/message.dart';
import 'package:chaty_app/app/features/messaging/domain/entities/user_conversation.dart';
import 'package:chaty_app/app/features/messaging/domain/repositories/messaging_repository.dart';

class MessagingRepositoryImpl implements MessagingRepository {
  final MessagingRemoteDatasource _remote;

  MessagingRepositoryImpl({required MessagingRemoteDatasource remote})
    : _remote = remote;

  @override
  Future<String> getOrCreateConversation({
    required String myUid,
    required String otherUid,
    required String myName,
    required String otherName,
  }) {
    return _remote.getOrCreateConversation(
      myUid: myUid,
      otherUid: otherUid,
      myName: myName,
      otherName: otherName,
    );
  }

  @override
  Stream<List<UserConversation>> watchUserConversations({
    required String userId,
    int limit = 50,
  }) {
    return _remote
        .watchUserConversations(userId: userId, limit: limit)
        .map((docs) => docs.map(_userConversationFromDoc).toList());
  }

  @override
  Stream<List<Message>> watchMessages({
    required String conversationId,
    int limit = 50,
  }) {
    return _remote
        .watchMessages(conversationId: conversationId, limit: limit)
        .map((docs) => docs.map(_messageFromDoc).toList());
  }

  @override
  Future<void> sendMessage({
    required String conversationId,
    required String myUid,
    required String otherUid,
    required String text,
  }) {
    return _remote.sendMessage(
      conversationId: conversationId,
      myUid: myUid,
      otherUid: otherUid,
      text: text,
    );
  }

  // ===== mappers (Document -> Entity) =====

  UserConversation _userConversationFromDoc(UserConversationDocumentModel doc) {
    return UserConversation(
      conversationId: doc.conversationId,
      otherUserId: doc.otherUserId,
      otherUserName: doc.otherUserName,
      lastMessage: doc.lastMessage,
      lastMessageAt: doc.lastMessageAt,
    );
  }

  Message _messageFromDoc(MessageDocumentModel doc) {
    return Message(
      id: doc.id,
      senderId: doc.senderId,
      text: doc.text,
      sentAt: doc.sentAt,
    );
  }

  @override
  Future<void> deleteConversation({
    required String myUid,
    required conversationId,
  }) async {
    await _remote.deleteConversation(
      myUid: myUid,
      conversationId: conversationId,
    );
  }
}
