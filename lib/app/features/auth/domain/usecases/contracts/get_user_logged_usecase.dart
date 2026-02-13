import 'package:chaty_app/app/features/auth/domain/entities/user_account.dart';

abstract class GetUserLoggedUsecase {
  Future<UserAccount?> call();
}