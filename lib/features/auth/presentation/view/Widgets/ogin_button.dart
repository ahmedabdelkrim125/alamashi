import 'package:flutter/material.dart';
import '../../../../../core/style.dart';
import '../../../../../core/theme_color.dart';
import '../../../../../constant.dart';
import '../widgets/cutom_button.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return CutomButton(
      onTap: () {
        if (formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ThemeColor.primaryColor,
              content: Text(
                'تم تسجيل الدخول بنجاح',
                textAlign: TextAlign.center,
                style: Style.textStyle20.copyWith(fontFamily: cairoRegular),
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'ادخل بيانات الحقل',
                textAlign: TextAlign.center,
                style: Style.textStyle20.copyWith(fontFamily: cairoRegular),
              ),
            ),
          );
        }
      },
      textButton: 'تسجيل الحساب',
    );
  }
}
