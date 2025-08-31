import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/banner_image.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/banner_text_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 203.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: ThemeColor.charcoalColor.withOpacity(.3),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 6),
          ),
        ],
        color: ThemeColor.greenColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 17.w),
          Expanded(child: BannerTextContent()),
          SizedBox(width: 12.w),
          Expanded(child: BannerImage()),
        ],
      ),
    );
  }
}
