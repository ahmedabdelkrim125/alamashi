import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/cutom_textfiled.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/lable_text.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    required this.texthit,
    required this.textLable,
    this.prefix,
    required this.controller,
  });
  final String texthit;
  final String textLable;
  final Widget? prefix;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LableText(
          textLable: texthit,
        ),
        CustomTextField(
          prefix: prefix,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '';
            }
            return null;
          },
          texthit: texthit,
        ),
      ],
    );
  }
}
