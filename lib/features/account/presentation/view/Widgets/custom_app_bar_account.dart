import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarAccount extends StatelessWidget {
  const CustomAppBarAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final iconSize = isTablet ? 30.0 : 24.0;

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'الملف الشخصي',
              style: Style.textStyle16.copyWith(
                color: ThemeColor.charcoalColor,
                fontFamily: cairoMedium,
              ),
            ),
            IconButton(
              onPressed: () => context.go(AppRouter.kMain),
              padding: EdgeInsets.zero,
              icon: SvgPicture.asset(
                Assets.chevronRight,
                width: iconSize,
                height: iconSize,
              ),
            ),
          ],
        );
      },
    );
  }
}
