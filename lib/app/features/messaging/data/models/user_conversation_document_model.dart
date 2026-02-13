class UserConversationDocumentModel {
  final String id;
  final String conversationId;
  final String otherUserId;
  final String otherUserName;
  final String lastMessage;
  final DateTime lastMessageAt;

  UserConversationDocumentModel({
    required this.id,
    required this.conversationId,
    required this.otherUserId,
    required this.otherUserName,
    required this.lastMessage,
    required this.lastMessageAt,
  });

  Map<String, dynamic> toMap() => {
        'conversationId': conversationId,
        'otherUserId': otherUserId,
        'otherUserName': otherUserName,
        'lastMessage': lastMessage,
        'lastMessageAt': lastMessageAt,
      };

  factory UserConversationDocumentModel.fromMap(String id, Map<String, dynamic> map) {
    return UserConversationDocumentModel(
      id: id,
      conversationId: (map['conversationId'] ?? id) as String,
      otherUserId: (map['otherUserId'] ?? '') as String,
      otherUserName: (map['otherUserName'] ?? '') as String,
      lastMessage: (map['lastMessage'] ?? '') as String,
      lastMessageAt: map['lastMessageAt'] as DateTime? ?? DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
