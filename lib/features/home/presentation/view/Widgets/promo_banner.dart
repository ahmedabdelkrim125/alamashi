import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/banner_image.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/banner_text_content.dart';
import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final containerWidth = isTablet ? 400.0 : 343.0;
        final containerHeight = isTablet ? 220.0 : 184.0;
        final borderRadius = isTablet ? 20.0 : 16.0;
        final firstSpacing = isTablet ? 20.0 : 17.0;
        final secondSpacing = isTablet ? 15.0 : 12.0;

        return Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: ThemeColor.charcoalColor.withOpacity(.3),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 6),
              ),
            ],
            color: ThemeColor.greenColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: firstSpacing),
              Expanded(child: BannerTextContent()),
              SizedBox(width: secondSpacing),
              Expanded(child: BannerImage()),
            ],
          ),
        );
      },
    );
  }
}
