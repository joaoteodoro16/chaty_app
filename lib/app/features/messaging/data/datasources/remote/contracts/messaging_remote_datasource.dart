import 'package:chaty_app/app/features/messaging/data/models/message_document_model.dart';
import 'package:chaty_app/app/features/messaging/data/models/user_conversation_document_model.dart';

abstract class MessagingRemoteDatasource {
  /// Cria a conversa se não existir e retorna o conversationId (determinístico)
  Future<String> getOrCreateConversation({
    required String myUid,
    required String otherUid,
    required String myName,
    required String otherName,
  });

  /// Inbox do usuário em tempo real
  Stream<List<UserConversationDocumentModel>> watchUserConversations({
    required String userId,
    int limit = 50,
  });

  /// Mensagens em tempo real
  Stream<List<MessageDocumentModel>> watchMessages({
    required String conversationId,
    int limit = 50,
  });

  /// Enviar mensagem e atualizar metadados/inbox
  Future<void> sendMessage({
    required String conversationId,
    required String myUid,
    required String otherUid,
    required String text,
  });
}
