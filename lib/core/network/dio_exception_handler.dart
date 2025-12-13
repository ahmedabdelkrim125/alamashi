// Path: lib/core/network/dio_exception_handler.dart

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:egyptian_supermaekat/core/errors/error_model.dart';
import 'package:egyptian_supermaekat/core/errors/exceptions.dart';

class DioExceptionHandler {
  static ServerException handle(DioException e) {
    if (_isConnectionError(e.type)) {
      return _handleConnectionError(e);
    }

    if (e.type == DioExceptionType.badResponse) {
      return _handleBadResponse(e);
    }

    return _handleUnknownError(e);
  }

  static bool _isConnectionError(DioExceptionType type) {
    return type == DioExceptionType.connectionTimeout ||
        type == DioExceptionType.sendTimeout ||
        type == DioExceptionType.receiveTimeout ||
        type == DioExceptionType.connectionError ||
        type == DioExceptionType.cancel ||
        type == DioExceptionType.unknown;
  }

  static ServerException _handleConnectionError(DioException e) {
    String errorMessage;
    
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = "انتهت مهلة الاتصال. يرجى المحاولة مرة أخرى.";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "انتهت مهلة إرسال البيانات. يرجى المحاولة مرة أخرى.";
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "انتهت مهلة استقبال البيانات. يرجى المحاولة مرة أخرى.";
        break;
      case DioExceptionType.connectionError:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
      default:
        errorMessage = "فشل الاتصال بالخادم. تحقق من اتصالك بالإنترنت.";
    }

    return ServerException(
      errorModel: ErrorModel(
        status: 503,
        errorMessage: errorMessage,
      ),
    );
  }

  /// معالجة الـ Bad Response
  static ServerException _handleBadResponse(DioException e) {
    final statusCode = e.response?.statusCode ?? 500;
    final data = e.response?.data;

    // معالجة Redirect (3xx)
    if (statusCode >= 300 && statusCode < 400) {
      return ServerException(
        errorModel: ErrorModel(
          status: statusCode,
          errorMessage: "خطأ في الاتصال. تأكد من رابط السيرفر.",
        ),
        statusCode: statusCode,
      );
    }

    // معالجة الأخطاء (4xx, 5xx)
    if (data != null && statusCode >= 400) {
      if (data is Map<String, dynamic>) {
        return ServerException(
          errorModel: ErrorModel.fromJson(data),
          statusCode: statusCode,
        );
      } else if (data is String) {
        return _handleStringResponse(data, statusCode);
      }
    }

    // Default error
    return ServerException(
      errorModel: ErrorModel(
        status: statusCode,
        errorMessage: "حدث خطأ غير متوقع من الخادم.",
      ),
      statusCode: statusCode,
    );
  }

  /// معالجة الـ Response كـ String
  static ServerException _handleStringResponse(String data, int statusCode) {
    try {
      final decoded = jsonDecode(data) as Map<String, dynamic>;
      return ServerException(
        errorModel: ErrorModel.fromJson(decoded),
        statusCode: statusCode,
      );
    } catch (_) {
      return ServerException(
        errorModel: ErrorModel(
          status: statusCode,
          errorMessage: data,
        ),
        statusCode: statusCode,
      );
    }
  }

  /// معالجة الأخطاء غير المعروفة
  static ServerException _handleUnknownError(DioException e) {
    return ServerException(
      errorModel: ErrorModel(
        status: 500,
        errorMessage: e.message ?? "حدث خطأ غير معروف.",
      ),
    );
  }
}