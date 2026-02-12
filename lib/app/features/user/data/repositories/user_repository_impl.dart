import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/core/domain/value_objects/email.dart';
import 'package:chaty_app/app/features/user/data/datasources/contracts/user_remote_datasource.dart';
import 'package:chaty_app/app/features/user/domain/repositories/user_repository.dart';
import 'package:chaty_app/app/features/user/models/user_document_model.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDatasource _remote;

  UserRepositoryImpl({required UserRemoteDatasource remote}) : _remote = remote;

  @override
  Future<UserAccount?> getUserByEmail(String email) async {
    final result = await _remote.getUserByEmail(email);
    if (result == null) return null;
    return UserAccount(
      id: result.id,
      name: result.name,
      email: Email.tryCreate(result.email)!,
    );
  }

  @override
  Future<UserAccount?> getUserById(String uid) async {
    final result = await _remote.getUserById(uid);
    if (result == null) return null;
    return UserAccount(
      id: result.id,
      name: result.name,
      email: Email.tryCreate(result.email)!,
    );
  }

  @override
  Future<void> upsertUser(UserDocumentModel user) async{
    await _remote.upsertUser(user);
  }
}
