import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/cutom_forget_text.dart';
import 'package:flutter/material.dart';

class LoginForgetPassword extends StatelessWidget {
  const LoginForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: CutomForgetText(
        textline: 'هل نسيت كلمة المرور؟',
      ),
    );
  }
}
