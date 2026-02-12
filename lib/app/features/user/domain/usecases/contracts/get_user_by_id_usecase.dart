import 'package:chaty_app/app/core/domain/entities/user_account.dart';

abstract class GetUserByIdUsecase {
  Future<UserAccount> call({required String userId});
}