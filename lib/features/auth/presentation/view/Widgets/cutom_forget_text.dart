import 'dart:developer';

import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';

class CutomForgetText extends StatelessWidget {
  const CutomForgetText({
    super.key,
    required this.textline,
    this.autofocus,
  });
  final String textline;
  final bool? autofocus;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        log('نسيت كلمة المرور؟');
      },
      child: Text(
        textline,
        style: Style.textStyle16.copyWith(
          fontFamily: cairoRegular,
          color: ThemeColor.primaryColor,
        ),
      ),
    );
  }
}
