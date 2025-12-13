import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShopNowButton extends StatelessWidget {
  const ShopNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final width = isTablet ? 200.0 : 171.0;
        final height = isTablet ? 50.0 : 40.0;
        final spacing = isTablet ? 12.0 : 8.0;

        return GestureDetector(
          onTap: () {},
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                colors: [
                  ThemeColor.forestGreenColor,
                  ThemeColor.primaryGreenColor,
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
            child: Center(
              child: Row(
                spacing: spacing,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.shopping_),
                  Text(
                    'تسوق الأن',
                    textAlign: TextAlign.center,
                    style: Style.textStyle18.copyWith(
                      fontFamily: cairoSemiBold,
                      fontWeight: FontWeight.w600,
                      color: ThemeColor.bgColor,
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
