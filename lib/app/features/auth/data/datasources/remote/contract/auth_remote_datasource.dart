import 'package:chaty_app/app/features/auth/data/dtos/login_user_account_dto.dart';

abstract class AuthRemoteDatasource {
  Future<LoginUserAccountDto?> login({required String email, required String password});
}