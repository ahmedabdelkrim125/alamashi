import 'package:dio/dio.dart';
import 'package:egyptian_supermaekat/core/utils/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // تثبيت الهيدر الأساسي
    options.headers['Content-Type'] = 'application/json';

    // إضافة الـ Access Token لو موجود
    final String? accessToken = CacheHelper.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    // ✅ لازم تناديها مرة واحدة بس
    return handler.next(options);
  }
}
