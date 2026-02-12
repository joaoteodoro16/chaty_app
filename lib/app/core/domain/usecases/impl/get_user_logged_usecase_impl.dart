import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/core/domain/usecases/contracts/get_user_logged_usecase.dart';
import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/auth/domain/repositories/auth_repository.dart';

class GetUserLoggedUsecaseImpl extends GetUserLoggedUsecase {
  final AuthRepository _authRepository;

  GetUserLoggedUsecaseImpl({required AuthRepository authRepository})
    : _authRepository = authRepository;

  @override
  Future<UserAccount> call() async {
    final user = await _authRepository.getUserLogged();
    if(user == null) throw GenericException(message: "Houve um problema ao buscar a sessão atual");
    return user;
  }
}
