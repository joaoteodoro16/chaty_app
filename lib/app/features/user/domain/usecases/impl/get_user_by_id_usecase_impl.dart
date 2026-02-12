import 'package:chaty_app/app/features/auth/domain/entities/user_account.dart';
import 'package:chaty_app/app/features/user/domain/repositories/user_repository.dart';
import 'package:chaty_app/app/features/user/domain/usecases/contracts/get_user_by_id_usecase.dart';

class GetUserByIdUsecaseImpl extends GetUserByIdUsecase {
  final UserRepository _userRepository;

  GetUserByIdUsecaseImpl({required UserRepository userRepository})
    : _userRepository = userRepository;

  @override
  Future<UserAccount> call({required String userId}) async {
    final user = await _userRepository.getUserById(userId);
    return user!;
  }
}
