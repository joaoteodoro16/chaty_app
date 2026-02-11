import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/params/signup_params.dart';

abstract class SignupUsecase {
  Future<UserAccount> call({required SignupParams params});
}