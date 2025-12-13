import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final paddingHorizontal = isTablet ? 25.0 : 16.0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: Text(
            title,
            textAlign: TextAlign.end,
            style: Style.textStyle18.copyWith(
              fontFamily: cairoBold,
              color: ThemeColor.charcoalGrey,
              decoration: TextDecoration.underline,
            ),
          ),
        );
      },
    );
  }
}
