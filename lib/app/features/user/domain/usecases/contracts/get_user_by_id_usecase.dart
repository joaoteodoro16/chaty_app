import 'package:chaty_app/app/features/auth/domain/entities/user_account.dart';

abstract class GetUserByIdUsecase {
  Future<UserAccount> call({required String userId});
}