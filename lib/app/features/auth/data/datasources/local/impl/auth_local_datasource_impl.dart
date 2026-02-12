import 'package:chaty_app/app/core/persistence/shared_preferences/app_shared_preferences.dart';
import 'package:chaty_app/app/core/persistence/shared_preferences/shared_preferences_keys.dart';
import 'package:chaty_app/app/features/auth/data/datasources/local/contract/auth_local_datasource.dart';
import 'package:chaty_app/app/features/auth/data/models/logged_user_model.dart';

class AuthLocalDatasourceImpl extends AuthLocalDatasource {
  final AppSharedPreferences _preferences;

  AuthLocalDatasourceImpl({required AppSharedPreferences preferences})
    : _preferences = preferences;

  @override
  Future<void> saveUserLoggedLocal({required LoggedUserModel user}) async {
    final json = user.toJson();
    await _preferences.saveString(
      key: SharedPreferencesKeys.userLoggedKey,
      string: json,
    );
  }

  @override
  Future<LoggedUserModel?> getUserLogged() async {
    final json = await _preferences.getString(
      key: SharedPreferencesKeys.userLoggedKey,
    );

    if (json == null) return null;

    return LoggedUserModel.fromJson(json);
  }
  
  @override
  Future<void> clearUserLoggedLocal() async{
    await _preferences.clearKey(key: SharedPreferencesKeys.userLoggedKey);
  }
}
