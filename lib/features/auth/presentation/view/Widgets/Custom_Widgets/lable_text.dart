//lable_text.dart
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';

class LableText extends StatelessWidget {
  const LableText({super.key, required this.textLable});
  final String textLable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        textLable,
        style: Style.textStyle14.copyWith(
          fontFamily: cairoBold,
          color: ThemeColor.charcoalColor,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}
