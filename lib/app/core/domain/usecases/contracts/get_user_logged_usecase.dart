import 'package:chaty_app/app/core/domain/entities/user_account.dart';

abstract class GetUserLoggedUsecase {
  Future<UserAccount> call();
}