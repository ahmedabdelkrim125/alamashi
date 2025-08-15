import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';

class CreateAccountTitle extends StatelessWidget {
  final String title;
  final Widget? iconButton;

  const CreateAccountTitle({
    super.key,
    this.iconButton,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
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
          if (iconButton != null)
            Positioned(
              right: 0,
              child: iconButton!,
            ),
        ],
      ),
    );
  }
}
