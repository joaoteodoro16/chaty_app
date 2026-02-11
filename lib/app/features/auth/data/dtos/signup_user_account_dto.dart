import 'dart:convert';

class SignupUserAccountDto {
  final String id;
  final String name;
  final String email;

  SignupUserAccountDto({
    required this.id,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email};
  }

  factory SignupUserAccountDto.fromMap(Map<String, dynamic> map) {
    return SignupUserAccountDto(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupUserAccountDto.fromJson(String source) =>
      SignupUserAccountDto.fromMap(json.decode(source));
}
