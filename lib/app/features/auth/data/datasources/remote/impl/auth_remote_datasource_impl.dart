import 'package:chaty_app/app/core/clients/auth/auth_client.dart';
import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/auth/data/datasources/remote/contract/auth_remote_datasource.dart';
import 'package:chaty_app/app/features/auth/data/dtos/login_user_account_dto.dart';
import 'package:chaty_app/app/features/auth/data/dtos/signup_user_account_dto.dart';
import 'package:chaty_app/app/features/auth/data/dtos/signup_user_account_request_dto.dart';

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  final AuthClient _authClient;

  AuthRemoteDatasourceImpl({required AuthClient authClient})
    : _authClient = authClient;

  @override
  Future<LoginUserAccountDto> login({
    required String email,
    required String password,
  }) async {
    final userCredencial = await _authClient.authWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredencial.user;
    if (user == null) {
      throw GenericException(
        message: "Ocorreu um erro inesperado ao realizar o login",
      );
    }
    final loginUserAccount = LoginUserAccountDto(
      id: user.uid,
      name: user.displayName ?? 'Não definido',
      email: email,
    );
    return loginUserAccount;
  }

  @override
  Future<SignupUserAccountDto> signup({
    required SignupUserAccountRequestDto userRequest,
  }) async {
    final userCredencial = await _authClient.createUserWithEmailAndPassword(
      email: userRequest.email,
      password: userRequest.password,
    );

    final user = userCredencial.user;

    if (user == null) {
      throw GenericException(
        message: "Ocorreu um erro inesperado ao realizar o login",
      );
    }

    await _authClient.updateUserDisplayName(newName: userRequest.name);

    final signupUserAccount = SignupUserAccountDto(
      id: user.uid,
      name: userRequest.name,
      email: user.email!,
    );
    return signupUserAccount;
  }
}
