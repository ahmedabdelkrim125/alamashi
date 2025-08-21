//cutom_textfiled.dart
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.texthit,
      this.validator,
      required this.controller,
      this.prefix});
  final Widget? prefix;
  final String texthit;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hint: Align(
              alignment: Alignment.centerRight,
              child: Text(
                texthit,
                style: Style.textStyle16.copyWith(
                  fontFamily: cairoRegular,
                  color: ThemeColor.neutralGrayColor,
                ),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: ThemeColor.lightBorderColor,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              // لما تدوس على الحقل
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: ThemeColor.lightBorderColor, // نفس اللون الرمادي
                width: 2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: ThemeColor.lightBorderColor,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              // لو فيه خطأ
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              // خطأ + ضغط على الحقل
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            prefix: prefix,
          )),
    );
  }
}
