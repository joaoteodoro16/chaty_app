import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/features/auth/domain/repositories/auth_repository.dart';

import './get_user_logged_usecase.dart';

class GetUserLoggedUsecaseImpl extends GetUserLoggedUsecase {
  final AuthRepository _authRepository;

  GetUserLoggedUsecaseImpl({required AuthRepository repository})
    : _authRepository = repository;

  @override
  Future<UserAccount?> call() async{
    return await _authRepository.getUserLogged();
  }
}
