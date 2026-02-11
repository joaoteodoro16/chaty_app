import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/core/domain/value_objects/email.dart';
import 'package:chaty_app/app/features/auth/data/datasources/remote/contract/auth_remote_datasource.dart';
import 'package:chaty_app/app/features/auth/data/dtos/signup_user_account_request_dto.dart';
import 'package:chaty_app/app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource _remote;
  AuthRepositoryImpl({required AuthRemoteDatasource remote}) : _remote = remote;

  @override
  Future<UserAccount> login({
    required String email,
    required String password,
  }) async {
    final dto = await _remote.login(email: email, password: password);
    return UserAccount(
      id: dto.id,
      email: Email.tryCreate(dto.email)!,
      name: dto.name,
    );
  }

  @override
  Future<UserAccount> signup({
    required UserAccount user,
    required String password,
  }) async {
    final userRequest = SignupUserAccountRequestDto(
      name: user.name,
      email: user.email.value,
      password: password,
    );
    final dto = await _remote.signup(userRequest: userRequest);
    return UserAccount(
      id: dto.id,
      name: dto.name,
      email: Email.tryCreate(dto.email)!,
    );
  }
}
