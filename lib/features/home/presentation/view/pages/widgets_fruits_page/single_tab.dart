import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleTab extends StatelessWidget {
  const SingleTab({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30.r),
      child: Container(
        height: 36.h,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          color: isSelected ? ThemeColor.brandColor : Colors.transparent,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: ThemeColor.graniteGray, width: 1.5),
        ),
        child: Center(
          child: Text(
            title,
            style: Style.textStyle14.copyWith(
              fontFamily: cairoSemiBold,
              color: isSelected ? ThemeColor.bgColor : ThemeColor.graniteGray,
            ),
          ),
        ),
      ),
    );
  }
}
