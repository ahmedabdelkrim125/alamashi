import 'package:dio/dio.dart';
import 'package:egyptian_supermaekat/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;
  final int? statusCode;

  ServerException({this.statusCode, required this.errorModel});
}

void handelDioException(DioException e) {
  final fallbackError =
      ErrorModel(errorMessage: "حدث خطأ في الاتصال بالسيرفر", status: 0);

  if (e.response == null || e.response?.data == null) {
    throw ServerException(
      errorModel: fallbackError,
      statusCode: e.response?.statusCode,
    );
  }

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
      throw ServerException(
        errorModel: ErrorModel.fromJson(e.response!.data),
        statusCode: e.response?.statusCode,
      );
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
        case 401:
        case 402:
        case 403:
        case 404:
        case 409:
        case 422:
        case 504:
          throw ServerException(
            errorModel: ErrorModel.fromJson(
              e.response!.data,
            ),
            statusCode: e.response?.statusCode,
          );
        default:
          throw ServerException(
            errorModel: fallbackError,
            statusCode: e.response?.statusCode,
          );
      }
  }
}
