import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A responsive button that adapts to different screen sizes
/// Uses MediaQuery for layout dimensions and ScreenUtil for font sizes
class ResponsiveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? borderRadius;
  final BorderSide? borderSide;

  const ResponsiveButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.borderRadius,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery for responsive layout
    final isTablet = ResponsiveHelper.isTablet(context);
    final buttonHeight = height ?? (isTablet ? 60.0 : 50.0);
    final buttonWidth = width ?? double.infinity;
    final buttonPadding =
        padding ??
        (isTablet
            ? const EdgeInsets.symmetric(horizontal: 24, vertical: 16)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 12));

    return Container(
      width: buttonWidth,
      height: buttonHeight,
      margin: margin ?? ResponsiveHelper.getPadding(context),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: buttonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            side: borderSide ?? BorderSide.none,
          ),
          textStyle: TextStyle(
            fontSize: isTablet ? 18.sp : 16.sp, // ScreenUtil for font size
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: isTablet ? 18.sp : 16.sp, // ScreenUtil for font size
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
