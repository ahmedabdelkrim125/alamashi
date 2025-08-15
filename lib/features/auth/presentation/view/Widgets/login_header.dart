import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/style.dart';
import '../../../../../core/theme_color.dart';
import '../../../../../constant.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'مرحباً بك',
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
            'من فضلك قم بإدخال بياناتك لكي تتمكن من تسجيل الدخول',
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
