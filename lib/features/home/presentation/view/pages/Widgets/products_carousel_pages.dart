import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsCarouselPages extends StatelessWidget {
  final String image; // ✅ الصورة
  final String title; // ✅ اسم المنتج
  final String size; // ✅ الحجم (مثال: 330 مل)
  final String price; // ✅ السعر (مثال: 15 ج.م)
  final void Function()? onTap;

  const ProductsCarouselPages({
    super.key,
    required this.image,
    required this.title,
    required this.size,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168.w,
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
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 150.w,
                height: 131.h,
                decoration: BoxDecoration(
                  color: ThemeColor.grayColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Center(
                  child: Image.asset(
                    image, // ✅ هنا الصورة
                    width: 146.92.w,
                    height: 119.w,
                  ),
                ),
              ),
              Positioned(
                top: 75.h,
                right: -20.w,
                child: InkWell(
                  onTap: onTap,
                  child: Image.asset(
                    Assets.add,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 14.h),
          Text(
            title, // ✅ اسم المنتج
            style: Style.textStyle14.copyWith(
              fontFamily: cairoSemiBold,
            ),
          ),
          Text(
            size, // ✅ الحجم
            style: Style.textStyle14.copyWith(
              fontFamily: cairoSemiBold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ج.م', // العملة ثابتة
                style: Style.textStyle12.copyWith(
                  fontFamily: cairoBold,
                ),
              ),
              Text(
                price, // ✅ السعر
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
