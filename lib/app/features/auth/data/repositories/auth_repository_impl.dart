import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/core/domain/value_objects/email.dart';
import 'package:chaty_app/app/features/auth/data/datasources/local/contract/auth_local_datasource.dart';
import 'package:chaty_app/app/features/auth/data/datasources/remote/contract/auth_remote_datasource.dart';
import 'package:chaty_app/app/features/auth/data/dtos/signup_user_account_request_dto.dart';
import 'package:chaty_app/app/features/auth/data/models/logged_user_model.dart';
import 'package:chaty_app/app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource _remote;
  final AuthLocalDatasource _local;
  AuthRepositoryImpl({
    required AuthRemoteDatasource remote,
    required AuthLocalDatasource local,
  }) : _remote = remote,
       _local = local;

  @override
  Future<UserAccount> login({
    required String email,
    required String password,
  }) async {
    final dto = await _remote.login(email: email, password: password);

    final saveUser = LoggedUserModel(
      id: dto.id,
      name: dto.name,
      email: dto.email,
    );
    await _local.saveUserLoggedLocal(user: saveUser);

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

  @override
  Future<UserAccount?> getUserLogged() async {
    final userLogged = await _local.getUserLogged();
    if (userLogged == null) return null;
    return UserAccount(
      id: userLogged.id,
      name: userLogged.name,
      email: Email.tryCreate(userLogged.email)!,
    );
  }
}
