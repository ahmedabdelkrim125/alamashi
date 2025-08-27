// lib/core/utils/show_snackbar.dart

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
  //
  final Color finalColor = backgroundColor ??
      (isError ? ThemeColor.errorColor : ThemeColor.primaryColor);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: finalColor,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: Style.textStyle18.copyWith(fontFamily: cairoRegular),
      ),
    ),
  );
}
