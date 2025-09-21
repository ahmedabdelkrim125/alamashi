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
        width: 163.w,
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
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.w),
                  child: Container(
                    width: 147.w,
                    height: 147.h,
                    decoration: BoxDecoration(
                      color: ThemeColor.lightSilver,
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
                ),
                Positioned(
                  top: 88.h,
                  right: -25.w,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      Assets.add,
                      width: 100.w,
                      height: 100.h,
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
                  Row(
                    spacing: 18.22.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        spacing: 4.w,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(Assets.ratingStarIcon),
                          Text(
                            '4.5',
                            style: Style.textStyle14.copyWith(
                              fontFamily: cairoSemiBold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'طماطم  1 كجم',
                        textAlign: TextAlign.end,
                        style: Style.textStyle14.copyWith(
                          fontFamily: cairoRegular,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'حوالي 8 - 12 قطعه',
                      style: Style.textStyle14.copyWith(
                        color: ThemeColor.darkGrayTextColor,
                        fontFamily: cairoRegular,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        ' ج .م',
                        style: Style.textStyle14.copyWith(
                          fontFamily: cairoBold,
                        ),
                      ),
                      Text(
                        '15.34',
                        style: Style.textStyle14.copyWith(
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