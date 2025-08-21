
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmCodeHeader extends StatelessWidget {
  const ConfirmCodeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'أدخل الكود ',
              style: Style.textStyle14.copyWith(
                fontWeight: FontWeight.w700,
                fontFamily: cairoBold,
                color: ThemeColor.darkGreenColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Text(
              'يجب أن تختلف عن القديمه',
              textAlign: TextAlign.end,
              style: Style.textStyle12.copyWith(
                fontWeight: FontWeight.w700,
                fontFamily: cairoBold,
                color: ThemeColor.neutralGrayColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
