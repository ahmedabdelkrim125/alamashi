import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductDealWidget extends StatelessWidget {
  const ProductDealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Container(
        width: 160.w,
        height: 220.h,
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
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(
                  width: 147.w,
                  height: 147.h,
                  decoration: BoxDecoration(
                    color: ThemeColor.grayColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Image.asset(
                      Assets.image444,
                      width: 146.92.w,
                      height: 119.w,
                    ),
                  ),
                ),
                Positioned(
                  top: 80.h,
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
            Spacer(flex: 1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                spacing: 8.h,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'لوكر بسكويت',
                      textAlign: TextAlign.end,
                      style: Style.textStyle14.copyWith(
                        fontFamily: cairoSemiBold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                    mainAxisAlignment: MainAxisAlignment.end,
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
            ),
            Spacer(flex: 1)
          ],
        ),
      ),
    );
  }
}



 // ProductImage()
 //ProductDetailsSection