class UserDocumentModel {
  final String? id;
  final String email;
  final String name;
  final DateTime createdAt;

  UserDocumentModel({
    this.id,
    required this.email,
    required this.name,
    DateTime? createdAt,
  }) : createdAt = DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'email': email.trim().toLowerCase(),
      'name': name,
      'createdAt': createdAt,
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
