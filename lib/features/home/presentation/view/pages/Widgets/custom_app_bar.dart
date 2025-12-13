import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomAppBar({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = ResponsiveHelper.isTablet(context);
            final firstPadding = isTablet ? 35.0 : 31.66;
            final svgWidth = isTablet ? 18.0 : 15.0;
            final svgHeight = isTablet ? 18.0 : 15.0;
            final secondPadding = isTablet ? 20.0 : 16.0;
            final iconWidth = isTablet ? 28.0 : 24.0;
            final iconHeight = isTablet ? 28.0 : 24.0;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: firstPadding),
                  child: IconButton(
                    onPressed: onPressed,
                    icon: SvgPicture.asset(
                      Assets.icsearch,
                      width: svgWidth,
                      height: svgHeight,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: secondPadding),
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
                        padding: EdgeInsets.zero,
                        icon: SvgPicture.asset(
                          Assets.chevronRight,
                          width: iconWidth,
                          height: iconHeight,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
