//interface
import 'package:egyptian_supermaekat/core/utils/cache_helper.dart';

abstract class AuthLocalDataSource {
  Future<void> saveTokens({required String accessToken, String? refreshToken});

  String? getAccessToken();
  String? getRefreshToken();

  //dalate Tokens (Logout)
  Future<void> clearTokens();
}

//**Implementation  => AuthLocalDataSource **//

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> clearTokens() async {
    await CacheHelper.removeAccessToken();
    await CacheHelper.removeRefreshToken();
  }

  @override
  String? getAccessToken() {
    return CacheHelper.getAccessToken();
  }

  @override
  String? getRefreshToken() {
    return CacheHelper.getRefreshToken();
  }

  @override
  Future<void> saveTokens({
    required String accessToken,
    String? refreshToken,
  }) async {
    await CacheHelper.saveAccessToken(accessToken);
    if (refreshToken != null) {
      await CacheHelper.saveRefreshToken(refreshToken);
    }
  }
}
