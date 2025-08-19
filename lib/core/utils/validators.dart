class AppValidators {
  static String? validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }
  static String? validateEgyptianPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال رقم الهاتف';
    }
    if (value.length  !=11) {
       return 'يجب أن يكون الرقم مكون من 11 رقم';
    }
    if (!RegExp(r'^(010|011|012|015)').hasMatch(value)) {
      return 'يجب أن يبدأ الرقم بـ 010, 011, 012, أو 015';
  }
  return null;
  }

  static String? validatePassword(String? value){
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    }
    if (value.length <6) {
        return 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'يجب أن تحتوي على حرف كبير واحد على الأقل';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'يجب أن تحتوي على رقم واحد على الأقل';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*]'))) {
      return 'يجب أن تحتوي على علامة ترقيم واحدة على الأقل';
    }
    return null;
  }
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال البريد الإلكتروني';
    }
    
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'صيغة البريد الإلكتروني غير صحيحة';
    }
    return null;
  }
}
