class ConversationDocumentModel {
  final String id;
  final List<String> participants;
  final String lastMessage;
  final DateTime lastMessageAt;
  final String lastSenderId;
  final DateTime createdAt;

  ConversationDocumentModel({
    required this.id,
    required this.participants,
    required this.lastMessage,
    required this.lastMessageAt,
    required this.lastSenderId,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() => {
        'participants': participants,
        'lastMessage': lastMessage,
        'lastMessageAt': lastMessageAt,
        'lastSenderId': lastSenderId,
        'createdAt': createdAt,
      };

  factory ConversationDocumentModel.fromMap(String id, Map<String, dynamic> map) {
    return ConversationDocumentModel(
      id: id,
      participants: List<String>.from(map['participants'] ?? const <String>[]),
      lastMessage: (map['lastMessage'] ?? '') as String,
      lastMessageAt: map['lastMessageAt'] as DateTime? ?? DateTime.fromMillisecondsSinceEpoch(0),
      lastSenderId: (map['lastSenderId'] ?? '') as String,
      createdAt: map['createdAt'] as DateTime? ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
