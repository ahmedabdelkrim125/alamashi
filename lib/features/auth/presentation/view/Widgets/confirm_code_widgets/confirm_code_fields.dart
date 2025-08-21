// lib/.../Widgets/confirm_code_widgets/confirm_code_fields.dart

import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class ConfirmCodeFields extends StatelessWidget {
  const ConfirmCodeFields({
    super.key,
    required this.pinController,
    required this.focusNode,
  });

  final TextEditingController pinController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
     width: 55.75.w,
      height: 55.75.h,
      textStyle: TextStyle(fontSize: 22.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ThemeColor.darkGreenColor),
      ),
    );

    return Pinput(
      length: 4,
      controller: pinController,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,

      validator:AppValidators.confirmCode,
      separatorBuilder: (index) => SizedBox(width: 40.w),
    );
  }
}