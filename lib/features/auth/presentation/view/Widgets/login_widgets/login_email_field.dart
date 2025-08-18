import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/custom_form_text_field.dart';
import 'package:flutter/material.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
      controller: controller,
      textLable: 'البريد الالكتروني',
      texthit: 'البريد الالكتروني',
    );
  }
}
