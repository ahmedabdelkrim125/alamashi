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
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: ThemeColor.lightGrey,
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                svgAsset,
                width: 150.w,
                height: 150.h,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            text,
            style: Style.textStyle12.copyWith(fontFamily: cairoBold),
          ),
        ],
      ),
    );
  }
}
