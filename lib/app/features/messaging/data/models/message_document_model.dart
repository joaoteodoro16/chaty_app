class MessageDocumentModel {
  final String id; // doc.id
  final String senderId;
  final String text;
  final DateTime sentAt;

  MessageDocumentModel({
    required this.id,
    required this.senderId,
    required this.text,
    required this.sentAt,
  });

  Map<String, dynamic> toMap() => {
        'senderId': senderId,
        'text': text,
        'sentAt': sentAt,
      };

  factory MessageDocumentModel.fromMap(String id, Map<String, dynamic> map) {
    return MessageDocumentModel(
      id: id,
      senderId: (map['senderId'] ?? '') as String,
      text: (map['text'] ?? '') as String,
      sentAt: map['sentAt'] as DateTime? ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
