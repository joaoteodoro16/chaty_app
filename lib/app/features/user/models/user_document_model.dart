class UserDocumentModel {
  final String id;
  final String email;
  final String name;
  final DateTime? createdAt;

  UserDocumentModel({
    required this.id,
    required this.email,
    required this.name,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email.trim().toLowerCase(), 
      'name': name,
      if (createdAt != null) 'createdAt': createdAt,
    };
  }

  factory UserDocumentModel.fromMap(String id, Map<String, dynamic> map) {
    return UserDocumentModel(
      id: id,
      email: (map['email'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      createdAt: map['createdAt'] as DateTime?,
    );
  }
}
