import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/Custom_Widgets/cutom_textfiled.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/Custom_Widgets/lable_text.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    required this.texthit,
    required this.textLable,
    this.prefix,
    required this.controller, this.validator,
  });
  final String texthit;
  final String textLable;
  final Widget? prefix;
  final TextEditingController controller;
final String? Function(String?)? validator; 
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
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return '';
          //   }
          //   return null;
          // },
          validator: validator,
          texthit: texthit,
        ),
      ],
    );
  }
}
