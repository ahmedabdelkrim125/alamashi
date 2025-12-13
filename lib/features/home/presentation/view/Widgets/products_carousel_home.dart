import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class ProductsCarouselHome extends StatelessWidget {
  const ProductsCarouselHome({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final containerWidth = isTablet ? 200.0 : 166.0;
        final containerHeight = isTablet ? 300.0 : 250.0;
        final borderRadiusLarge = isTablet ? 25.0 : 20.0;
        final innerContainerWidth = isTablet ? 180.0 : 150.0;
        final innerContainerHeight = isTablet ? 180.0 : 150.0;
        final borderRadiusSmall = isTablet ? 10.0 : 8.0;
        final imageWidth = isTablet ? 170.0 : 146.92;
        final imageHeight = isTablet ? 140.0 : 119.0;
        final positionedTop = isTablet ? 100.0 : 83.0;
        final positionedRight = isTablet ? -30.0 : -25.0;
        final addIconWidth = isTablet ? 120.0 : 100.0;
        final addIconHeight = isTablet ? 120.0 : 100.0;
        final spacing = isTablet ? 18.0 : 14.0;
        final rowSpacing = isTablet ? 10.0 : 8.0;

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
                      color: ThemeColor.lightSilver,
                      borderRadius: BorderRadius.circular(borderRadiusSmall),
                    ),
                    child: Center(
                      //هنا
                      child: Image.asset(
                        Assets.image444,
                        width: imageWidth,
                        height: imageHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    top: positionedTop,
                    right: positionedRight,
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset(
                        Assets.add,
                        width: addIconWidth,
                        height: addIconHeight,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: spacing),
              Text(
                'لوكر بسكويت',
                style: Style.textStyle14.copyWith(fontFamily: cairoSemiBold),
              ),
              Row(
                spacing: rowSpacing,
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
                    style: Style.textStyle12.copyWith(fontFamily: cairoBold),
                  ),
                  Text(
                    '15',
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
