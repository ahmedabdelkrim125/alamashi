import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ShopNowButton extends StatelessWidget {
  const ShopNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 171.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            colors: [
              ThemeColor.forestGreenColor,
              ThemeColor.primaryGreenColor,
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Center(
          child: Row(
            spacing: 8.w, // Kept as is from your original code
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.shopping_),
              Text(
                'تسوق الأن',
                textAlign: TextAlign.center,
                style: Style.textStyle18.copyWith(
                  fontFamily: cairoSemiBold,
                  fontWeight: FontWeight.w600,
                  color: ThemeColor.bgColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}