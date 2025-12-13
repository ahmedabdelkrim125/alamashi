import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final containerWidth = isTablet ? 200.0 : 168.0;
        final containerHeight = isTablet ? 260.0 : 220.0;
        final borderRadiusLarge = isTablet ? 25.0 : 20.0;
        final innerContainerWidth = isTablet ? 180.0 : 150.0;
        final innerContainerHeight = isTablet ? 150.0 : 131.0;
        final borderRadiusSmall = isTablet ? 20.0 : 16.0;
        final imageWidth = isTablet ? 170.0 : 146.92;
        final imageHeight = isTablet ? 140.0 : 119.0;
        final positionedTop = isTablet ? 90.0 : 75.0;
        final positionedRight = isTablet ? -25.0 : -20.0;
        final spacing = isTablet ? 18.0 : 14.0;

        return Container(
          width: containerWidth,
          height: containerHeight,
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
            borderRadius: BorderRadius.circular(borderRadiusLarge),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: innerContainerWidth,
                    height: innerContainerHeight,
                    decoration: BoxDecoration(
                      color: ThemeColor.grayColor,
                      borderRadius: BorderRadius.circular(borderRadiusSmall),
                    ),
                    child: Center(
                      child: Image.asset(
                        image, // ✅ هنا الصورة
                        width: imageWidth,
                        height: imageHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    top: positionedTop,
                    right: positionedRight,
                    child: InkWell(
                      onTap: onTap,
                      child: Image.asset(Assets.add),
                    ),
                  ),
                ],
              ),
              SizedBox(height: spacing),
              Text(
                title, // ✅ اسم المنتج
                style: Style.textStyle14.copyWith(fontFamily: cairoSemiBold),
              ),
              Text(
                size, // ✅ الحجم
                style: Style.textStyle14.copyWith(fontFamily: cairoSemiBold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ج.م', // العملة ثابتة
                    style: Style.textStyle12.copyWith(fontFamily: cairoBold),
                  ),
                  Text(
                    price, // ✅ السعر
                    style: Style.textStyle12.copyWith(fontFamily: cairoBold),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
