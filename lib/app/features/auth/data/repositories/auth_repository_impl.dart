
import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/features/auth/data/datasources/remote/contract/auth_remote_datasource.dart';
import 'package:chaty_app/app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  final AuthRemoteDatasource _remote;
  AuthRepositoryImpl({required AuthRemoteDatasource remote}) : _remote = remote;
  
  @override
  Future<UserAccount?> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }
}