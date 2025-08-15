import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/cutom_button.dart';
import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/core/utils/show_snackbar.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return CutomButton(
      onTap: () {
        if (formKey.currentState!.validate()) {
          showCustomSnackBar(
            context: context,
            message: 'تم تسجيل الدخول بنجاح',
            backgroundColor: ThemeColor.primaryColor,
          );
        } else {
          showCustomSnackBar(
            context: context,
            message: 'ادخل بيانات الحقل',
            backgroundColor: Colors.red,
          );
        }
      },
      textButton: 'تسجيل الحساب',
    );
  }
}
