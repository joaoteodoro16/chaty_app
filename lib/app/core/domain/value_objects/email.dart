import 'package:chaty_app/app/core/exceptions/exeptions.dart';

class Email {
  final String value;
  Email._(this.value);
  static Email? tryCreate(String input) {
    final cleaned = input.trim();
    if (RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(cleaned)) {
      return Email._(cleaned);
    }
    throw ArgumentException(message: "Informe um email válido");
  }
}