import 'package:chaty_app/app/core/domain/value_objects/email.dart';
import 'package:chaty_app/app/core/exceptions/exeptions.dart';

class UserAccount {
  final String? id;
  final String _name;
  final Email _email;

  UserAccount._({this.id, required String name, required Email email})
      : _name = name,
        _email = email;

  factory UserAccount({
    String? id,
    required String name,
    required Email email,
  }) {
    final trimmed = name.trim();
    if (trimmed.isEmpty || trimmed.length > 100) {
      throw ArgumentException(
        message: "Nome deve conter entre 1 e 100 caracteres",
      );
    }

    return UserAccount._(id: id, name: trimmed, email: email);
  }

  String get name => _name;
  Email get email => _email;

  /// copyWith "seguro": passa pela factory (revalida invariantes)
  UserAccount copyWith({
    String? id,
    String? name,
    Email? email,
  }) {
    return UserAccount(
      id: id ?? this.id,
      name: name ?? _name,
      email: email ?? _email,
    );
  }

  /// Método de domínio (sem vazar regra pra fora)
  UserAccount rename(String newName) {
    return copyWith(name: newName);
  }

  UserAccount changeEmail(Email newEmail) {
    return copyWith(email: newEmail);
  }
}
