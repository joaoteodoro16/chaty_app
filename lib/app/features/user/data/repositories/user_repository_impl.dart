
import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/features/user/domain/repositories/user_repository.dart';
import 'package:chaty_app/app/features/user/models/user_document_model.dart';

class UserRepositoryImpl extends UserRepository{
  @override
  Future<UserAccount?> getUserByEmail(String emailLower) {
    // TODO: implement getUserByEmail
    throw UnimplementedError();
  }

  @override
  Future<UserAccount?> getUserById(String uid) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<void> upsertUser(UserDocumentModel user) {
    // TODO: implement upsertUser
    throw UnimplementedError();
  }
  
}