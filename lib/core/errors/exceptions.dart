import 'package:dio/dio.dart';
import 'package:egyptian_supermaekat/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handelDioException(DioException e) {


  Never handelDioException(DioException e) {
  // Default errorModel
  final fallbackError = ErrorModel(errorMessage: "حدث خطأ في الاتصال بالسيرفر",status:0 );

  if (e.response == null || e.response?.data == null) {
    throw ServerException(errorModel: fallbackError);
  }

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        // 400: Bad Request - الطلب فيه مشكلة أو البيانات غلط
        case 400:
        // 401: Unauthorized - المستخدم غير مصرح له (توكن أو صلاحية غير صحيحة)
        case 401:
        // 402: Payment Required - مطلوب دفع (نادر الاستخدام غالبًا)
        case 402:
        // 403: Forbidden - الطلب صحيح لكن الوصول مرفوض
        case 403:
        // 404: Not Found - المورد المطلوب مش موجود
        case 404:
        // 409: Conflict - تعارض في البيانات، مثلا بيانات موجودة مسبقًا
        case 409:
        // 422: Unprocessable Entity - البيانات صحية لكن السيرفر مش قادر يعالجها
        case 422:
        // 504: Gateway Timeout - السيرفر أو البوابة استغرقت وقت طويل
        case 504:
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        default:
          throw ServerException(errorModel: fallbackError);
      }
  }
}
}