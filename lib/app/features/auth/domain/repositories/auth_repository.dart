import 'package:chaty_app/app/core/domain/entities/user_account.dart';

abstract class AuthRepository {
  Future<UserAccount> login({required String email, required String password});
  Future<UserAccount> signup({required UserAccount user, required String password});
}