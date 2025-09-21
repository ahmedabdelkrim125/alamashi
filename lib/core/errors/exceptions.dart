import 'package:dio/dio.dart';
import 'package:egyptian_supermaekat/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;
  final int? statusCode;

  ServerException({this.statusCode, required this.errorModel});
}

void handelDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
    case DioExceptionType.cancel:
    case DioExceptionType.unknown:
      throw ServerException(
        errorModel: ErrorModel(
          status: 503,
          errorMessage: "فشل الاتصال بالخادم. تحقق من اتصالك بالإنترنت.",
        ),
      );

    case DioExceptionType.badResponse:
      final responseData = e.response!.data;
      if (responseData is Map<String, dynamic>) {
        throw ServerException(
          errorModel: ErrorModel.fromJson(responseData),
          statusCode: e.response!.statusCode,
        );
      } else {
        throw ServerException(
          errorModel: ErrorModel(
            status: e.response!.statusCode ?? 500,
            errorMessage: "حدث خطأ غير متوقع من الخادم.",
          ),
          statusCode: e.response!.statusCode,
        );
      }

    default:
      throw ServerException(
        errorModel: ErrorModel(
          status: 500,
          errorMessage: "حدث خطأ غير معروف.",
        ),
      );
  }
}
