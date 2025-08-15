import 'package:flutter/material.dart';
import '../widgets/cutom_forget_text.dart';

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
