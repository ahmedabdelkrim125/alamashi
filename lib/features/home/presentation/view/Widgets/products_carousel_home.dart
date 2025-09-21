import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class ProductsCarouselHome extends StatelessWidget {
  const ProductsCarouselHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 166.w,
      height: 250.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ThemeColor.charcoalColor.withOpacity(.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(4, 4),
          ),
        ],
        color: ThemeColor.bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 147.w,
                height: 147.h,
                decoration: BoxDecoration(
                  color: ThemeColor.lightSilver,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  //هنا
                  child: Image.asset(
                    Assets.image444,
                    width: 146.92.w,
                    height: 119.w,
                  ),
                ),
              ),
              Positioned(
                top: 90.h,
                right: -20.w,
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    Assets.add,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 14.h),
          Text(
            'لوكر بسكويت',
            style: Style.textStyle14.copyWith(
              fontFamily: cairoSemiBold,
            ),
          ),
          Row(
            spacing: 8.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.ratingStarIcon),
              Text(
                '4.8 (287)',
                style: Style.textStyle14.copyWith(
                  fontFamily: cairoSemiBold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' ج .م',
                style: Style.textStyle12.copyWith(
                  fontFamily: cairoBold,
                ),
              ),
              Text(
                '15',
                style: Style.textStyle12.copyWith(
                  fontFamily: cairoBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
