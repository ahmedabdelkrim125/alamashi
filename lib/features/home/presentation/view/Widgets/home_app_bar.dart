//home_app_bar.dart
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.only(
            left: 16.w,
          ),
          onPressed: () {},
          icon: SvgPicture.asset(
            Assets.icnotifications,
            width: 24.w,
            height: 24.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: Row(
            spacing: 6,
            children: [
              Column(
                children: [
                  Text(
                    'مرحباً',
                    style: Style.textStyle12.copyWith(
                      fontFamily: cairoMedium,
                      color: ThemeColor.darkMauve,
                    ),
                  ),
                  Text(
                    'احمد عبدالكريم',
                    style: Style.textStyle14.copyWith(
                      fontFamily: cairoRegular,
                      color: ThemeColor.textColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 50.w,
                height: 50.h,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/220364408?s=400&u=75e040eb362ce448eace0b341954a7121d421f14&v=4',
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
