// lib/.../Widgets/confirm_code_widgets/resend_code_button.dart

import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';

class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({
    super.key,
    required this.onPressed, 
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'إرسال الكود مرة أخرى؟',
          textAlign: TextAlign.end,
          style: Style.textStyle12.copyWith(
            color: ThemeColor.darkGreenColor,
            fontFamily: cairoBold,
          ),
        ),
      ),
    );
  }
}