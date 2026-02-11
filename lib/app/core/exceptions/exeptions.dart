sealed class AppException implements Exception {
  final String message;

  AppException({required this.message});
}

class GenericException extends AppException {
  GenericException({required super.message});
}

class ArgumentException extends AppException {
  ArgumentException({required super.message});
}
