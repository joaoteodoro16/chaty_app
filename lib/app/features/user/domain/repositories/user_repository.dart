import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/features/user/models/user_document_model.dart';

abstract class UserRepository {
  //TODO: VER SE VAI RECEBER UM USERDOCUENTMODEL MESMO AQUI 
  Future<void> upsertUser(UserDocumentModel user);
  Future<UserAccount?> getUserById(String uid);
  Future<UserAccount?> getUserByEmail(String emailLower);
}