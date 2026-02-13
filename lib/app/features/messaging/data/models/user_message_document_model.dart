class UserMessageDocumentModel {
  final String id;
  final String senderId;
  final String text;
  final DateTime sentAt;
  UserMessageDocumentModel({
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

  factory UserMessageDocumentModel.fromMap(
    String id,
    Map<String, dynamic> map,
  ) {
    return UserMessageDocumentModel(
      id: id,
      senderId: (map['senderId'] ?? '') as String,
      text: (map['text'] ?? '') as String,
      sentAt:
          map['sentAt'] as DateTime? ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
