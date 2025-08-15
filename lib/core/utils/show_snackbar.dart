import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/constant.dart';

void showCustomSnackBar({
  required BuildContext context,
  required String message,
  required Color backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: Style.textStyle20.copyWith(fontFamily: cairoRegular),
      ),
    ),
  );
}
