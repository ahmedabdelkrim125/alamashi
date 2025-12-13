import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    super.key,
    required this.text,
    required this.svgPicture,
    this.onTap,
  });
  final String text;
  final String svgPicture;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final horizontalPadding = isTablet ? 12.0 : 8.0;
        final verticalPadding = isTablet ? 12.0 : 8.0;
        final containerWidth = isTablet ? 500.0 : 400.0;
        final containerHeight = isTablet ? 60.0 : 48.0;
        final borderRadius = isTablet ? 20.0 : 16.0;
        final imageWidth = isTablet ? 30.0 : 24.0;
        final imageHeight = isTablet ? 30.0 : 24.0;
        final spacing = isTablet ? 8.0 : 6.0;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: containerWidth,
              height: containerHeight,
              decoration: BoxDecoration(
                color: ThemeColor.lightGreenBackground,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: SvgPicture.asset(Assets.back),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Row(
                      spacing: spacing,
                      children: [
                        Text(
                          text,
                          style: Style.textStyle18.copyWith(
                            fontFamily: cairoRegular,
                          ),
                        ),
                        Image.asset(
                          svgPicture,
                          width: imageWidth,
                          height: imageHeight,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
