
import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/core/domain/value_objects/email.dart';
import 'package:chaty_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/contracts/signup_usecase.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/params/signup_params.dart';

class SignupUsecaseImpl extends SignupUsecase{
  
  final AuthRepository _authRepository;

  SignupUsecaseImpl({required AuthRepository authRepository}) : _authRepository = authRepository;
  
  @override
  Future<UserAccount> call({required SignupParams params}) async{
    final user = UserAccount(
      id: null,
      name: params.name,
      email: Email.tryCreate(params.email)!,
    );
    return await  _authRepository.signup(user: user, password: params.password);
  }
 
}