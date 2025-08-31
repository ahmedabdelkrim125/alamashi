
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? iconButton;

  const CustomAppBar({
    super.key,
    this.iconButton,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 31.66.w),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.icsearch,
              width: 15.w,
              height: 15.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                title,
                style: Style.textStyle16.copyWith(
                  color: ThemeColor.charcoalColor,
                  fontFamily: cairoMedium,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset(
                  Assets.chevronRight,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


