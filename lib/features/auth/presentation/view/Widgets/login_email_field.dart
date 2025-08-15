import 'package:flutter/material.dart';
import '../widgets/custom_form_text_field.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
      textLable: 'البريد الالكتروني',
      texthit: 'البريد الالكتروني',
    );
  }
}
