import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chaty_app/app/features/user/domain/repositories/user_repository.dart';
import 'package:chaty_app/app/features/user/domain/usecases/contracts/get_user_by_id_usecase.dart';

class GetUserByIdUsecaseImpl extends GetUserByIdUsecase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  GetUserByIdUsecaseImpl({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  }) : _authRepository = authRepository,
       _userRepository = userRepository;

  @override
  Future<UserAccount> call() async {
    final userAccountLogged = await _authRepository.getUserLogged();
    if (userAccountLogged == null) {
      throw GenericException(
        message: "Ocorreu um erro inesperado ao buscar a sessão atual",
      );
    }
    final user = await _userRepository.getUserById(userAccountLogged.id!);
    return user!;
  }
  
}
