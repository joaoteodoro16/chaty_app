import 'package:chaty_app/app/features/user/models/user_document_model.dart';

abstract class UserRemoteDatasource {
  Future<void> upsertUser(UserDocumentModel user);
  Future<UserDocumentModel?> getUserById(String uid);
  Future<UserDocumentModel?> getUserByEmail(String emailLower);
}
