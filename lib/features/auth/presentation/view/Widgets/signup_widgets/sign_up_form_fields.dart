import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_phone_number_field.dart';
import 'package:flutter/material.dart';
import 'sign_up_name_field.dart';
import 'sign_up_email_field.dart';
import 'sign_up_password_field.dart';

class SignUpFormFields extends StatelessWidget {
  const SignUpFormFields({
    super.key,
    required this.controllerNameField,
    required this.controllerEmailField,
    required this.controllerPasswordField,
    required this.controllerNumberField,
  });
  final TextEditingController controllerNameField;
  final TextEditingController controllerEmailField;
  final TextEditingController controllerPasswordField;
  final TextEditingController controllerNumberField;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignUpNameField(
          controller: controllerNameField,
        ),
        SignUpEmailField(controller: controllerEmailField),
        SignUpPasswordField(
          controller: controllerPasswordField
        ),
        SignPhoneNumberField(
          controller: controllerNumberField,
        )
      ],
    );
  }
}
