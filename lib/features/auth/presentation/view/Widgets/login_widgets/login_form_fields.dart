import 'package:flutter/material.dart';
import 'login_email_field.dart';
import 'login_password_field.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({super.key, required this.controller});
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        LoginEmailField(controller: controller,),
        LoginPasswordField(controller: controller),
      ],
    );
  }
}
