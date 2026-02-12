import 'package:chaty_app/app/features/auth/domain/entities/user_account.dart';

abstract class LoginUsecase {
  Future<UserAccount> call({required String email, required String password});
}