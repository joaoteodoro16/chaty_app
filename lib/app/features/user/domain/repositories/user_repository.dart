import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/features/user/models/user_document_model.dart';

abstract class UserRepository {
  Future<void> upsertUser(UserDocumentModel user);
  Future<UserAccount?> getUserById(String uid);
  Future<UserAccount?> getUserByEmail(String email);
}