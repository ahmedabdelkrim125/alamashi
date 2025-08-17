import 'package:dio/dio.dart';
import 'package:egyptian_supermaekat/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handelDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      ServerException(
        errorModel: ErrorModel.fromJson(
          e.response!.data,
        ),
      );
    case DioExceptionType.sendTimeout:
      ServerException(
        errorModel: ErrorModel.fromJson(
          e.response!.data,
        ),
      );
    case DioExceptionType.receiveTimeout:
      ServerException(
        errorModel: ErrorModel.fromJson(
          e.response!.data,
        ),
      );
    case DioExceptionType.badCertificate:
      ServerException(
        errorModel: ErrorModel.fromJson(
          e.response!.data,
        ),
      );

    case DioExceptionType.cancel:
      ServerException(
        errorModel: ErrorModel.fromJson(
          e.response!.data,
        ),
      );
    case DioExceptionType.connectionError:
      ServerException(
        errorModel: ErrorModel.fromJson(
          e.response!.data,
        ),
      );
    case DioExceptionType.unknown:
      ServerException(
        errorModel: ErrorModel.fromJson(
          e.response!.data,
        ),
      );

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        // 400: Bad Request - الطلب فيه مشكلة أو البيانات غلط
        case 400:
          ServerException(
            errorModel: ErrorModel.fromJson(
              e.response!.data,
            ),
          );

        // 401: Unauthorized - المستخدم غير مصرح له (توكن أو صلاحية غير صحيحة)
        case 401:
          ServerException(
            errorModel: ErrorModel.fromJson(
              e.response!.data,
            ),
          );

        // 402: Payment Required - مطلوب دفع (نادر الاستخدام غالبًا)
        case 402:
          ServerException(
            errorModel: ErrorModel.fromJson(
              e.response!.data,
            ),
          );

        // 403: Forbidden - الطلب صحيح لكن الوصول مرفوض
        case 403:
          ServerException(
            errorModel: ErrorModel.fromJson(
              e.response!.data,
            ),
          );

        // 404: Not Found - المورد المطلوب مش موجود
        case 404:
          ServerException(
            errorModel: ErrorModel.fromJson(
              e.response!.data,
            ),
          );

        // 409: Conflict - تعارض في البيانات، مثلا بيانات موجودة مسبقًا
        case 409:
          ServerException(
            errorModel: ErrorModel.fromJson(
              e.response!.data,
            ),
          );

        // 422: Unprocessable Entity - البيانات صحية لكن السيرفر مش قادر يعالجها
        case 422:
          ServerException(
            errorModel: ErrorModel.fromJson(
              e.response!.data,
            ),
          );

        // 504: Gateway Timeout - السيرفر أو البوابة استغرقت وقت طويل
        case 504:
          ServerException(
            errorModel: ErrorModel.fromJson(
              e.response!.data,
            ),
          );
      }
  }
}
