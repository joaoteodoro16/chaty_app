import 'package:chaty_app/app/core/domain/entities/user_account.dart';

abstract class LoginUsecase {
  Future<UserAccount> call({required String email, required String password});
}