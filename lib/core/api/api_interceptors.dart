// api_interceptors.dart
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:egyptian_supermaekat/core/api/end_points.dart';
import 'package:egyptian_supermaekat/core/utils/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  final Dio dio;
  Completer<void>? _refreshCompleter;

  static const _publicEndpoints = {
    EndPoints.login,
    EndPoints.register,
    EndPoints.refresh,
  };

  static const _retriedKey = 'auth_retried';

  ApiInterceptors({required this.dio});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _setDefaultHeaders(options);

    final requestPath = options.uri.path;

    if (!_publicEndpoints.contains(requestPath)) {
      await _attachAuthToken(options);
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final status = err.response?.statusCode;

    if (status != null && status >= 300 && status < 400) {
      return handler.next(err);
    }

    if (status == 401) {
      await _handleUnauthorizedError(err, handler);
      return;
    }

    super.onError(err, handler);
  }

  void _setDefaultHeaders(RequestOptions options) {
    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
  }

  Future<void> _attachAuthToken(RequestOptions options) async {
    try {
      final token = await _getAccessToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (_) {}
  }

  Future<void> _handleUnauthorizedError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.requestOptions.extra[_retriedKey] == true) {
      return handler.next(err);
    }

    final refreshToken = await _getRefreshTokenSafely();
    if (refreshToken == null || refreshToken.isEmpty) {
      return handler.next(err);
    }

    try {
      await _refreshTokens(refreshToken);
      await _retryOriginalRequest(err, handler);
    } catch (_) {
      await _clearTokens();
      handler.next(err);
    }
  }

  Future<String?> _getRefreshTokenSafely() async {
    try {
      return await _getRefreshToken();
    } catch (_) {
      return null;
    }
  }

  Future<void> _refreshTokens(String refreshToken) async {
    if (_refreshCompleter != null) {
      await _refreshCompleter!.future;
      return;
    }

    _refreshCompleter = Completer<void>();

    try {
      final newTokens = await _performTokenRefresh(refreshToken);
      await _saveNewTokens(newTokens);
      _refreshCompleter!.complete();
    } catch (e) {
      _refreshCompleter!.completeError(e);
      rethrow;
    } finally {
      _refreshCompleter = null;
    }
  }

  Future<Map<String, String>> _performTokenRefresh(String refreshToken) async {
    final refreshDio = _createRefreshDio();
    final body = await _buildRefreshRequestBody(refreshToken);

    final response = await refreshDio.post(EndPoints.refresh, data: body);

    return _extractTokensFromResponse(response);
  }

  Future<Map<String, dynamic>> _buildRefreshRequestBody(
    String refreshToken,
  ) async {
    final body = {'refreshToken': refreshToken};

    try {
      final access = await _getAccessToken();
      if (access != null && access.isNotEmpty) body['accessToken'] = access;
    } catch (_) {}

    return body;
  }

  Dio _createRefreshDio() {
    return Dio()
      ..options.baseUrl = dio.options.baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..options.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
  }

  Map<String, String> _extractTokensFromResponse(Response response) {
    final data = response.data;

    final tokenData = data is Map && data.containsKey('data')
        ? data['data']
        : data;

    final access = tokenData['accessToken'] as String?;
    final refresh = tokenData['refreshToken'] as String?;

    if (access == null || refresh == null) {
      throw Exception('Invalid refresh response');
    }

    return {'accessToken': access, 'refreshToken': refresh};
  }

  Future<void> _saveNewTokens(Map<String, String> tokens) async {
    await Future.wait([
      CacheHelper.saveAccessToken(tokens['accessToken']!),
      CacheHelper.saveRefreshToken(tokens['refreshToken']!),
    ]);
  }

  Future<void> _clearTokens() async {
    await Future.wait([
      CacheHelper.removeAccessToken(),
      CacheHelper.removeRefreshToken(),
    ]);
  }

  Future<void> _retryOriginalRequest(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final newToken = await _getAccessToken();

    if (newToken == null || newToken.isEmpty) {
      return handler.next(err);
    }

    final original = err.requestOptions;

    final newOptions = RequestOptions(
      path: original.path,
      method: original.method,
      headers: {...original.headers, 'Authorization': 'Bearer $newToken'},
      queryParameters: original.queryParameters,
      data: original.data,
      extra: {...original.extra, _retriedKey: true},
      baseUrl: original.baseUrl,
      connectTimeout: original.connectTimeout,
      receiveTimeout: original.receiveTimeout,
      sendTimeout: original.sendTimeout,
      responseType: original.responseType,
      validateStatus: original.validateStatus,
      followRedirects: original.followRedirects,
      maxRedirects: original.maxRedirects,
    );

    try {
      final response = await dio.fetch(newOptions);
      handler.resolve(response);
    } catch (_) {
      handler.next(err);
    }
  }

  Future<String?> _getAccessToken() async {
    final result = CacheHelper.getAccessToken();
    return result is Future<String?> ? result : result;
  }

  Future<String?> _getRefreshToken() async {
    final result = CacheHelper.getRefreshToken();
    return result is Future<String?> ? result : result;
  }
}
