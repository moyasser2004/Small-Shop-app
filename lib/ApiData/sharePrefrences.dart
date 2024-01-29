import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesHelper {

  static SharedPreferences? share;

  static Future<void> init() async {
    share = await SharedPreferences.getInstance();
  }

 static Future<void> setData({
    required String key,
    required bool value,
  }) async{
    await share!.setBool(key, value);
  }

  static Future<bool?> getData({
    required String key
  }) async {
    return share!.getBool(key);
  }


 // get  token
  static Future<void> setToken({
    required String key,
    required String value,
  }) async{
    await share!.setString(key, value);
  }

  static Future<String?> getToken({
    required String key
  }) async {
    return share!.getString(key);
  }

}
