import 'package:chaty_app/app/features/auth/data/datasources/remote/contract/auth_remote_datasource.dart';
import 'package:chaty_app/app/features/auth/data/dtos/login_user_account_dto.dart';

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  @override
  Future<LoginUserAccountDto?> login({
    required String email,
    required String password,
  }) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
