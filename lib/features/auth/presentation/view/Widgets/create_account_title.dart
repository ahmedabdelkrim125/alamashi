import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';

class CreateAccountTitle extends StatelessWidget {
  final VoidCallback? onBackPressed;

  const CreateAccountTitle({
    super.key,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // أيقونة الرجوع
        // GestureDetector(
        //   onTap: onBackPressed ?? () => Navigator.pop(context),
        //   child: SvgPicture.asset(
        //     'assets/icons/back.svg', // حط مسار الأيقونة هنا
        //     width: 24.w,
        //     height: 24.h,
        //     colorFilter: ColorFilter.mode(
        //       ThemeColor.charcoalColor,
        //       BlendMode.srcIn,
        //     ),
        //   ),
        // ),
        // SizedBox(width: 12.w),

        // العنوان
        Text(
          'إنشاء حساب',
          style: Style.textStyle19.copyWith(
            color: ThemeColor.charcoalColor,
            fontFamily: cairoBold,
          ),
        ),
      ],
    );
  }
}
