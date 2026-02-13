import 'package:chaty_app/app/features/messaging/domain/entities/message.dart';
import 'package:chaty_app/app/features/messaging/domain/entities/user_conversation.dart';

abstract class MessagingRepository {
  /// Cria a conversa se não existir e retorna o conversationId
  Future<String> getOrCreateConversation({
    required String myUid,
    required String otherUid,
    required String myName,
    required String otherName,
  });

  /// Inbox do usuário (lista de conversas) em tempo real
  Stream<List<UserConversation>> watchUserConversations({
    required String userId,
    int limit = 50,
  });

  /// Mensagens em tempo real
  Stream<List<Message>> watchMessages({
    required String conversationId,
    int limit = 50,
  });

  /// Enviar mensagem
  Future<void> sendMessage({
    required String conversationId,
    required String myUid,
    required String otherUid,
    required String text,
  });

  Future<void> deleteConversation({required String myUid, required conversationId});
}
