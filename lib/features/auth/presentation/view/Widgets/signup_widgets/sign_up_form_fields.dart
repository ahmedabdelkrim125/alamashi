import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_phone_number_field.dart';
import 'package:flutter/material.dart';
import 'sign_up_name_field.dart';
import 'sign_up_email_field.dart';
import 'sign_up_password_field.dart';

class SignUpFormFields extends StatelessWidget {
  const SignUpFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SignUpNameField(),
        SignUpEmailField(),
        SignUpPasswordField(),
        SignPhoneNumberField()
      ],
    );
  }
}
