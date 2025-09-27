import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem(
      {super.key, required this.text, required this.svgPicture, this.onTap});
  final String text;
  final String svgPicture;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.w,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 400.w,
          height: 48.h,
          decoration: BoxDecoration(
              color: ThemeColor.lightGreenBackground,
              borderRadius: BorderRadius.circular(16.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: SvgPicture.asset(
                  Assets.back,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  spacing: 6.w,
                  children: [
                    Text(
                      text,
                      style: Style.textStyle18.copyWith(
                        fontFamily: cairoRegular,
                      ),
                    ),
                    Image.asset(
                      svgPicture,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}