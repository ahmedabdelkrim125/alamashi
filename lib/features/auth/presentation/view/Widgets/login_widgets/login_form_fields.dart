import 'package:flutter/material.dart';
import 'login_email_field.dart';
import 'login_password_field.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LoginEmailField(),
        LoginPasswordField(),
      ],
    );
  }
}
