import 'package:egyptian_supermaekat/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'مرحباً بك',
            textAlign: TextAlign.end,
            style: Style.textStyle18.copyWith(
              fontWeight: FontWeight.w700,
              fontFamily: cairoBold,
              color: ThemeColor.darkGreenColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Text(
            'من فضلك قم بإدخال بياناتك لكي تتمكن من إنشاء حساب',
            textAlign: TextAlign.end,
            style: Style.textStyle12.copyWith(
              fontWeight: FontWeight.w700,
              fontFamily: cairoBold,
              color: ThemeColor.neutralGrayColor,
            ),
          ),
        ),
      ],
    );
  }
}
