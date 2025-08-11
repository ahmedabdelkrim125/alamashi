//cutom_textfiled.dart
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,required this.texthit,this.validator,required this.controller});
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
                fontFamily: cairoSemiBold,
                color: ThemeColor.primaryColor,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: ThemeColor.primaryColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: ThemeColor.primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: ThemeColor.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
