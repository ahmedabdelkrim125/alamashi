import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/style.dart';

class CustomTab extends StatelessWidget {
  final String svgAsset;
  final String text;
  final VoidCallback? onTap;

  const CustomTab({
    super.key,
    required this.svgAsset,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final borderRadiusSmall = isTablet ? 25.0 : 20.0;
        final containerWidth = isTablet ? 100.0 : 80.0;
        final containerHeight = isTablet ? 85.0 : 70.0;
        final borderRadiusLarge = isTablet ? 40.0 : 35.0;
        final svgWidth = isTablet ? 50.0 : 40.0;
        final svgHeight = isTablet ? 40.0 : 35.0;
        final spacing = isTablet ? 15.0 : 10.0;
        final horizontalPadding = isTablet ? 20.0 : 15.0;

        return Material(
          color: Colors.transparent,
          child: InkWell(
            highlightColor: ThemeColor.primaryColor.withOpacity(0.1),
            splashColor: ThemeColor.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(borderRadiusSmall),
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(borderRadiusLarge),
                    border: Border.all(
                      width: 2,
                      color: ThemeColor.textColor.withOpacity(.7),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      svgAsset,
                      width: svgWidth,
                      height: svgHeight,
                    ),
                  ),
                ),
                SizedBox(height: spacing),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Text(
                    text,
                    style: Style.textStyle16.copyWith(fontFamily: cairoMedium),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
