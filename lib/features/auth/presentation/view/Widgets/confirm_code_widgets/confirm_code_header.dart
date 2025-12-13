import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class ConfirmCodeHeader extends StatelessWidget {
  const ConfirmCodeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final horizontalPadding = isTablet ? 24.0 : 16.0;
        final verticalPadding = isTablet ? 24.0 : 16.0;

        return Align(
          alignment: Alignment.topRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Text(
                  'أدخل الكود ',
                  style: Style.textStyle14.copyWith(
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
                  'يجب أن تختلف عن القديمه',
                  textAlign: TextAlign.end,
                  style: Style.textStyle12.copyWith(
                    fontWeight: FontWeight.w700,
                    fontFamily: cairoBold,
                    color: ThemeColor.neutralGrayColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
