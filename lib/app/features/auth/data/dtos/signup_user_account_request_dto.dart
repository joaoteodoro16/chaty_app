import 'dart:convert';

class SignupUserAccountRequestDto {
  final String name;
  final String email;
  final String password;

  SignupUserAccountRequestDto({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'password': password};
  }

  factory SignupUserAccountRequestDto.fromMap(Map<String, dynamic> map) {
    return SignupUserAccountRequestDto(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupUserAccountRequestDto.fromJson(String source) =>
      SignupUserAccountRequestDto.fromMap(json.decode(source));
}
