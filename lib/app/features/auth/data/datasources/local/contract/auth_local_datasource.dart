import 'package:chaty_app/app/features/auth/data/models/logged_user_model.dart';

abstract class AuthLocalDatasource {
  Future<void> saveUserLoggedLocal({required LoggedUserModel user});
  Future<LoggedUserModel?> getUserLogged();
}
