import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class CutomButton extends StatelessWidget {
  const CutomButton({super.key, required this.textButton, this.onTap});
  final String textButton;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = ResponsiveHelper.isTablet(context);
            final buttonWidth = isTablet
                ? constraints.maxWidth * 0.8
                : constraints.maxWidth * 0.9;

            return Container(
              width: buttonWidth,
              height: isTablet ? 60 : 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    ThemeColor.forestGreenColor,
                    ThemeColor.primaryGreenColor,
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Center(
                child: Text(
                  textButton,
                  textAlign: TextAlign.center,
                  style: Style.textStyle14.copyWith(
                    fontFamily: cairoSemiBold,
                    fontWeight: FontWeight.w600,
                    color: ThemeColor.bgColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
