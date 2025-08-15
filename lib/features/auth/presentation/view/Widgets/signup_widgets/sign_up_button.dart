import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/cutom_button.dart';
import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/core/utils/show_snackbar.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SignUpButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return CutomButton(
      onTap: () {
        if (formKey.currentState!.validate()) {
          showCustomSnackBar(
            context: context,
            message: 'تم انشاء الحساب بنجاح',
            backgroundColor: ThemeColor.primaryColor,
          );
        } else {
          showCustomSnackBar(
            context: context,
            message: 'ادخل بيانات الحقل',
            backgroundColor: ThemeColor.errorColor,
          );
        }
      },
      textButton: 'انشاء حساب',
    );
  }
}
