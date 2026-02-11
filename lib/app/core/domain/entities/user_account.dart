import 'package:chaty_app/app/core/domain/value_objects/email.dart';
import 'package:chaty_app/app/core/exceptions/exeptions.dart';

class UserAccount {
  final String? id;
  final String _name;
  final Email _email;

  // Construtor privado
  UserAccount._({this.id, required String name, required Email email})
      : _name = name,
        _email = email;

  // Factory que valida antes de criar
  factory UserAccount({
    String? id,
    required String name,
    required Email email,
  }) {
    final trimmed = name.trim();
    if (trimmed.isEmpty || trimmed.length > 100) {
      throw ArgumentException(message: "Nome deve conter entre 1 e 100 caracteres");
    }
    
    return UserAccount._(id: id, name: trimmed, email: email);
  }

  String get name => _name;
  Email get email => _email;

  // Retorna uma nova instância (imutabilidade)
  UserAccount rename(String newName) {
    final trimmed = newName.trim();
    if (trimmed.isEmpty || trimmed.length > 100) {
      throw ArgumentException(message: "Nome deve conter entre 1 e 100 caracteres");
    }
    return UserAccount._(id: id, name: trimmed, email: _email);
  }

  UserAccount changeEmail(Email newEmail) {
    return UserAccount._(id: id, name: _name, email: newEmail);
  }
}