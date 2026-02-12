import 'package:chaty_app/app/core/exceptions/exeptions.dart';

class Message {
  final String id;
  final String senderId;
  final String text;
  final DateTime sentAt;

  Message({
    required this.id,
    required this.senderId,
    required this.text,
    required this.sentAt,
  }) {
    if (senderId.trim().isEmpty) {
      throw ArgumentException(message: 'senderId é obrigatório');
    }
    if (text.trim().isEmpty) {
      throw ArgumentException(message: 'Mensagem não pode ser vazia');
    }
  }

  bool isMine(String myUid) => senderId == myUid;
}
