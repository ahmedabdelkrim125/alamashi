import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/custom_form_text_field.dart';

class SignPhoneNumberField extends StatelessWidget {
  const SignPhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
      textLable: 'رقم الهاتف ',
      texthit: 'رقم الهاتف',
    );
  }
}
