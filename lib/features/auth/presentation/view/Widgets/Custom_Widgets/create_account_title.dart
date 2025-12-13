import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';

class CreateAccountTitle extends StatelessWidget {
  final String title;
  final Widget? iconButton;

  const CreateAccountTitle({super.key, this.iconButton, required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final height = isTablet ? 50.0 : 40.0;

        return SizedBox(
          height: height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  title,
                  style: Style.textStyle19.copyWith(
                    color: ThemeColor.charcoalColor,
                    fontFamily: cairoBold,
                  ),
                ),
              ),
              if (iconButton != null) Positioned(right: 0, child: iconButton!),
            ],
          ),
        );
      },
    );
  }
}
