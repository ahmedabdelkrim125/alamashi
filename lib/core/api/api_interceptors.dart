import 'package:dio/dio.dart';
import 'package:egyptian_supermaekat/core/api/end_points.dart';
import 'package:egyptian_supermaekat/core/utils/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  final Dio dio;
  ApiInterceptors({required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    final String path = options.path;

    if (path != EndPoints.login &&
        path != EndPoints.register &&
        path != EndPoints.refresh) {
      final String? accessToken = CacheHelper.getAccessToken();
      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != null &&
        err.response!.statusCode! >= 300 &&
        err.response!.statusCode! < 400) {
      return handler.next(err);
    }

    if (err.response?.statusCode == 401) {
      final refreshToken = CacheHelper.getRefreshToken();

      if (refreshToken != null && refreshToken.isNotEmpty) {
        try {
          final refreshDio = Dio();

          refreshDio.options.baseUrl = dio.options.baseUrl;
          refreshDio.options.headers['Content-Type'] = 'application/json';
          refreshDio.options.headers['Accept'] = 'application/json';

          final refreshResponse = await refreshDio.post(
            EndPoints.refresh,
            data: {'refreshToken': refreshToken},
          );

          final newAccessToken = refreshResponse.data['accessToken'];
          final newRefreshToken = refreshResponse.data['refreshToken'];

          await CacheHelper.saveAccessToken(newAccessToken);
          await CacheHelper.saveRefreshToken(newRefreshToken);

          final opts = err.requestOptions;
          opts.headers['Authorization'] = 'Bearer $newAccessToken';

          final clonedRequest = await dio.fetch(opts);
          return handler.resolve(clonedRequest);
        } catch (e) {
          await CacheHelper.removeAccessToken();
          await CacheHelper.removeRefreshToken();
          return handler.next(err);
        }
      } else {
        return handler.next(err);
      }
    }

    super.onError(err, handler);
  }
}