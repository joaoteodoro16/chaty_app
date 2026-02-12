import 'dart:convert';

class ContactDocumentModel {
  final String contactUserId;
  final String email;
  final String name;
  final String? surname;
  final DateTime addedAt;

  ContactDocumentModel({
    required this.contactUserId,
    required this.email,
    required this.name,
    this.surname,
    DateTime? addedAt,
  }) : addedAt = addedAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'contactUserId' : contactUserId,
      'email': email,
      'name': name,
      'surname': surname,
      'addedAt': addedAt,
    };
  }

  factory ContactDocumentModel.fromMap(String contactUserId, Map<String, dynamic> map) {
    return ContactDocumentModel(
      contactUserId: contactUserId,
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      addedAt: map['addedAt'] as DateTime?,
    );
  }

  String toJson() => json.encode(toMap());
}
