import 'package:egyptian_supermaekat/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/style.dart';

class CustomTab extends StatelessWidget {
  final String svgAsset;
  final String text;
  final VoidCallback? onTap;

  const CustomTab({
    super.key,
    required this.svgAsset,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: ThemeColor.primaryColor.withOpacity(0.1),
        splashColor: ThemeColor.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80.w,
              height: 70.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(40.r),
                border: Border.all(
                  width: 2,
                  color: ThemeColor.forestGreenColor,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  svgAsset,
                  width: 40.w,
                  height: 35.h,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                text,
                style: Style.textStyle16.copyWith(
                  fontFamily: cairoMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
