import 'package:chaty_app/app/core/exceptions/exeptions.dart';

class UserConversation {
  final String conversationId;
  final String otherUserId;
  final String otherUserName;
  final String lastMessage;
  final DateTime lastMessageAt;

  UserConversation({
    required this.conversationId,
    required this.otherUserId,
    required this.otherUserName,
    required this.lastMessage,
    required this.lastMessageAt,
  }) {
    if (conversationId.trim().isEmpty) {
      throw ArgumentException(message: 'conversationId é obrigatório');
    }
    if (otherUserId.trim().isEmpty) {
      throw ArgumentException(message: 'otherUserId é obrigatório');
    }
  }
}
