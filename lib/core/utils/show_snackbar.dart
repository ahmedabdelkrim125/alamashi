import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/constant.dart';

void showCustomSnackBar({
  required BuildContext context,
  required String message,
 Color? backgroundColor,
   bool isError = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: isError? ThemeColor.errorColor:ThemeColor.primaryColor,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: Style.textStyle20.copyWith(fontFamily: cairoRegular),
      ),
    ),
  );
}
