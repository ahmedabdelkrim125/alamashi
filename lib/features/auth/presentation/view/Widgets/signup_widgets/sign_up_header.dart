import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final horizontalPadding = isTablet ? 24.0 : 16.0;
        final verticalPadding = isTablet ? 24.0 : 16.0;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'مرحباً بك',
                textAlign: TextAlign.end,
                style: Style.textStyle18.copyWith(
                  fontWeight: FontWeight.w700,
                  fontFamily: cairoBold,
                  color: ThemeColor.darkGreenColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Text(
                'من فضلك قم بإدخال بياناتك لكي تتمكن من إنشاء حساب',
                textAlign: TextAlign.end,
                style: Style.textStyle12.copyWith(
                  fontWeight: FontWeight.w700,
                  fontFamily: cairoBold,
                  color: ThemeColor.neutralGrayColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
