import 'package:chaty_app/app/features/auth/data/dtos/login_user_account_dto.dart';
import 'package:chaty_app/app/features/auth/data/dtos/signup_user_account_dto.dart';
import 'package:chaty_app/app/features/auth/data/dtos/signup_user_account_request_dto.dart';

abstract class AuthRemoteDatasource {
  Future<LoginUserAccountDto> login({required String email, required String password});
  Future<SignupUserAccountDto> signup({required SignupUserAccountRequestDto userRequest});
}