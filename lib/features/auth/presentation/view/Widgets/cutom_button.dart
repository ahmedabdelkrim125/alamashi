import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CutomButton extends StatelessWidget {
  const CutomButton({super.key, required this.textButton, this.onTap});
  final String textButton;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 40.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [
                ThemeColor.darkGreenColor,
                ThemeColor.primaryGreenColor,
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Center(
            child: Text(
              textButton,
              textAlign: TextAlign.center,
              style: Style.textStyle14.copyWith(
                fontFamily: cairoSemiBold,
                fontWeight: FontWeight.w600,
                color: ThemeColor.bgColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
