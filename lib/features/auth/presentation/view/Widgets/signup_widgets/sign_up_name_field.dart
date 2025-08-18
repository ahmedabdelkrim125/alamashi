import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/custom_form_text_field.dart';

class SignUpNameField extends StatelessWidget {
  const SignUpNameField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
      controller: controller,
      textLable: 'الاسم',
      texthit: 'الاسم',
    );
  }
}
