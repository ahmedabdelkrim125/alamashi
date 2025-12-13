import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class SingleTab extends StatelessWidget {
  const SingleTab({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final borderRadius = isTablet ? 40.0 : 30.0;
        final height = isTablet ? 50.0 : 36.0;
        final paddingHorizontal = isTablet ? 35.0 : 24.0;

        return InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            height: height,
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
            decoration: BoxDecoration(
              color: isSelected ? ThemeColor.brandColor : Colors.transparent,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: ThemeColor.graniteGray, width: 1.5),
            ),
            child: Center(
              child: Text(
                title,
                style: Style.textStyle14.copyWith(
                  fontFamily: cairoSemiBold,
                  color: isSelected
                      ? ThemeColor.bgColor
                      : ThemeColor.graniteGray,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
