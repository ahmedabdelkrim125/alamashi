import 'package:egyptian_supermaekat/core/utils/validators.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/Custom_Widgets/custom_form_text_field.dart';
import 'package:flutter/material.dart';

class SignPhoneNumberField extends StatelessWidget {
  const SignPhoneNumberField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
      controller: controller,
      textLable: 'رقم الهاتف ',
      texthit: 'رقم الهاتف',
      validator: AppValidators.validateEgyptianPhoneNumber,
    );
  }
}
