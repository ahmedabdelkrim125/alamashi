import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/custom_form_text_field.dart';

class SignUpEmailField extends StatelessWidget {
  const SignUpEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
      textLable: 'البريد الالكتروني',
      texthit: 'البريد الالكتروني',
    );
  }
}