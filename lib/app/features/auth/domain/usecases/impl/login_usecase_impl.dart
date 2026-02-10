
import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/contracts/login_usecase.dart';

class LoginUsecaseImpl extends LoginUsecase{
  
  final AuthRepository _authRepository;

  LoginUsecaseImpl({required AuthRepository authRepository}) : _authRepository = authRepository;

  @override
  Future<UserAccount?> call({required String email, required String password}) async{
    // TODO: implement call
    throw UnimplementedError();
  }
  
}