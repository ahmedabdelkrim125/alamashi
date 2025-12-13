import 'dart:developer';
import 'package:egyptian_supermaekat/core/errors/exceptions.dart';

class ErrorMessageMapper {
  static String mapServerExceptionToMessage(ServerException e) {
    final statusCode = e.errorModel.status;
    final errorMessage = e.errorModel.errorMessage ;
    
    log("DEBUG: HTTP Status Code ==> ${e.statusCode}");
    log("DEBUG: Response Body Status ==> $statusCode");
    log("DEBUG: Server Error Message ==> $errorMessage");

    if (errorMessage.isNotEmpty) {
      final specificMessage = _checkSpecificErrors(errorMessage);
      if (specificMessage != null) {
        return specificMessage;
      }
    }

    return _mapStatusCodeToMessage(statusCode, errorMessage);
  }

  static String? _checkSpecificErrors(String errorMessage) {
    final lowerMessage = errorMessage.toLowerCase();

    if (lowerMessage.contains("phone") && lowerMessage.contains("already")) {
      final phoneMatch = RegExp(r"'(\d+)'").firstMatch(errorMessage);
      final phone = phoneMatch?.group(1) ?? '';
      return "رقم الهاتف ${phone.isNotEmpty ? phone : 'هذا'} مسجل بالفعل.";
    }
    
    if (lowerMessage.contains("email") && lowerMessage.contains("already")) {
      return "البريد الإلكتروني مسجل بالفعل.";
    }
    
    if (lowerMessage.contains("username") && lowerMessage.contains("already")) {
      return "اسم المستخدم مسجل بالفعل.";
    }

    if (lowerMessage.contains("invalid") && lowerMessage.contains("password")) {
      return "كلمة المرور غير صحيحة.";
    }

    if (lowerMessage.contains("not found") || 
        lowerMessage.contains("invalid credentials")) {
      return "البريد الإلكتروني أو كلمة المرور غير صحيحة.";
    }

    if (lowerMessage.contains("not verified") || 
        lowerMessage.contains("not activated")) {
      return "الحساب غير مفعل. يرجى تفعيل حسابك أولاً.";
    }

    if (lowerMessage.contains("blocked") || 
        lowerMessage.contains("banned") ||
        lowerMessage.contains("suspended")) {
      return "تم حظر حسابك. يرجى التواصل مع الدعم الفني.";
    }

    return null;
  }

  static String _mapStatusCodeToMessage(int statusCode, String errorMessage) {
    switch (statusCode) {
      case 400:
        return errorMessage.isNotEmpty 
          ? errorMessage 
          : "البيانات المدخلة غير صحيحة.";
      
      case 401:
        return "البريد الإلكتروني أو كلمة المرور غير صحيحة.";
      
      case 403:
        return "ليس لديك الصلاحية للقيام بهذا الإجراء.";
      
      case 404:
        return "الرابط المطلوب غير موجود على الخادم.";
      
      case 409:
        return "البيانات مسجلة بالفعل. جرب بيانات مختلفة.";
      
      case 422:
        return "البيانات المدخلة غير صالحة. يرجى التحقق من جميع الحقول.";
      
      case 429:
        return "لقد تجاوزت الحد المسموح من المحاولات. يرجى المحاولة لاحقاً.";
      
      case 500:
        return "حدث خطأ في الخادم، يرجى المحاولة مرة أخرى في وقت لاحق.";
      
      case 503:
        return "الخدمة غير متاحة حاليًا أو لا يوجد اتصال بالإنترنت.";
      
      default:
        return errorMessage.isNotEmpty 
          ? errorMessage 
          : "حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.";
    }
  }
}
