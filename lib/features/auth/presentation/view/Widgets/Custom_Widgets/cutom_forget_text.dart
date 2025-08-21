import 'dart:developer';

import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        context.go(AppRouter.kForgotPassword);
      },
      child: Text(
        textline,
        style: Style.textStyle14.copyWith(
          fontFamily: cairoRegular,
          color: ThemeColor.darkGreenColor,
        ),
      ),
    );
  }
}
