import 'package:egyptian_supermaekat/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/custom_form_text_field.dart';

class SignUpEmailField extends StatelessWidget {
  const SignUpEmailField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
      controller: controller,
      textLable: 'البريد الالكتروني',
      texthit: 'البريد الالكتروني',
       validator: AppValidators.validateEmail,
    );
  }
}
