import 'package:chaty_app/app/core/domain/value_objects/email.dart';
import 'package:chaty_app/app/core/exceptions/exeptions.dart';

class Contact {
  final String _contactUserId;
  final String _name;
  final String? surname;
  final Email _email;

  Contact._({required String contactUserId, required String name, this.surname, required Email email})
    : _name = name,
      _email = email, _contactUserId = contactUserId;

  factory Contact({
    required String id,
    required String name,
    required Email email,
    String? surname,
  }) {
    final validName = _setName(name);
    return Contact._(contactUserId: id, name: validName, email: email, surname: surname);
  }

  String get name => _name;
  Email get email => _email;
  String get contactUserId => _contactUserId;

  static String _setName(String name) {
    if (name.isEmpty) {
      throw ArgumentException(message: "Nome do contato é obrigatório");
    }
    return name;
  }

  Contact copyWith({String? contactUserId, String? name, String? surname, Email? email}) {
    return Contact(
      id: contactUserId ?? this.contactUserId,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
    );
  }
}
