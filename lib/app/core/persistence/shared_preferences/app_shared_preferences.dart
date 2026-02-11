import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  late SharedPreferences instance;

  Future<void> _setInstance() async {
    instance = await SharedPreferences.getInstance();
  }

  Future<void> saveString({required String key, required String string}) async {
    await _setInstance();
    await instance.setString(key, string);
  }

  Future<String?> getString({required String key}) async {
    try{
      await _setInstance();
    return instance.getString(key);
    }catch(e){
      return null;
    }
  }
}
