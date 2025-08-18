import 'package:egyptian_supermaekat/core/api/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;
  //initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //AccessToken//
  static Future<void> saveAccessToken(String token) async {
    await _prefs.setString(ApiKeys.accessToken, token);
  }

  static String? getAccessToken() {
    return _prefs.getString(ApiKeys.accessToken);
  }

  static Future<void> removeAccessToken() async {
    await _prefs.remove(ApiKeys.accessToken);
  }

  //Refresh Token//
  static Future<void> saveRefreshToken(String token) async {
    await _prefs.setString(ApiKeys.refreshToken, token);
  }

  static String? getRefreshToken() {
    return _prefs.getString(ApiKeys.refreshToken);
  }

  static Future<void> removeRefreshToken() async {
    await _prefs.remove(ApiKeys.refreshToken);
  }
}
