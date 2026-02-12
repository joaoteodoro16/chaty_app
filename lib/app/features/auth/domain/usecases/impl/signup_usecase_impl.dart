import 'package:chaty_app/app/features/auth/domain/entities/user_account.dart';
import 'package:chaty_app/app/core/domain/value_objects/email.dart';
import 'package:chaty_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/contracts/signup_usecase.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/params/signup_params.dart';
import 'package:chaty_app/app/features/user/domain/repositories/user_repository.dart';
import 'package:chaty_app/app/features/user/models/user_document_model.dart';

class SignupUsecaseImpl extends SignupUsecase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  SignupUsecaseImpl({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  }) : _authRepository = authRepository,
       _userRepository = userRepository;

  @override
  Future<UserAccount> call({required SignupParams params}) async {
    final user = UserAccount(
      id: null,
      name: params.name,
      email: Email.tryCreate(params.email)!,
    );

    final createdUser = await _authRepository.signup(
      user: user,
      password: params.password,
    );

    await _userRepository.upsertUser(
      UserDocumentModel(
        id: createdUser.id,
        email: createdUser.email.value,
        name: createdUser.name,
      ),
    );

    return createdUser;
  }
}
