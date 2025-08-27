import 'dart:developer';

import 'package:egyptian_supermaekat/core/utils/cache_helper.dart';

Future<void> debugTokens() async {
  final access = CacheHelper.getAccessToken();
  final refresh = CacheHelper.getRefreshToken();

  log("🟢 DEBUG TOKENS -------------------");
  log("Access Token from cache: $access");
  log("Refresh Token from cache: $refresh");
  log("-----------------------------------");
}
