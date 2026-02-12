import 'package:chaty_app/app/features/auth/domain/entities/user_account.dart';

abstract class AuthRepository {
  Future<UserAccount> login({required String email, required String password});
  Future<UserAccount> signup({required UserAccount user, required String password});

  Future<void> logout();
  Future<UserAccount?> getUserLogged();
}