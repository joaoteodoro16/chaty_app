
import 'package:chaty_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chaty_app/app/features/conversation/domain/usecases/contracts/logout_usecase.dart';

class LogoutUsecaseImpl extends LogoutUsecase{
  final AuthRepository _authRepository;

  LogoutUsecaseImpl({required AuthRepository authRepository}) : _authRepository = authRepository;

  @override
  Future<void> call() async{
    await _authRepository.logout();
  }
}