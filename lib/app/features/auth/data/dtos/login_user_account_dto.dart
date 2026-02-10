import 'dart:convert';


class LoginUserAccountDto {
  final String id;
  final String name;
  final String email;
  
  LoginUserAccountDto({
    required this.id,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory LoginUserAccountDto.fromMap(Map<String, dynamic> map) {
    return LoginUserAccountDto(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUserAccountDto.fromJson(String source) => LoginUserAccountDto.fromMap(json.decode(source));
}
