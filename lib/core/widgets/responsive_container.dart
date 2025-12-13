import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

/// A responsive container that uses MediaQuery for layout dimensions
/// and ScreenUtil for font sizes
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Color? color;
  final BorderRadius? borderRadius;
  final BoxShape shape;
  final BorderSide? borderSide;
  final double? elevation;
  final AlignmentGeometry? alignment;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.borderSide,
    this.elevation,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery for layout calculations
    final deviceWidth = MediaQuery.of(context).size.width;
    // final isTablet = ResponsiveHelper.isTablet(context);

    // Calculate responsive dimensions
    double? responsiveWidth = width;
    double? responsiveHeight = height;

    // Adjust dimensions based on device type if not explicitly set
    if (width == null && height != null) {
      responsiveWidth = deviceWidth * ResponsiveHelper.getWidthFactor(context);
    }

    // Create decoration
    BoxDecoration? decoration;
    if (color != null || borderRadius != null || borderSide != null) {
      decoration = BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        border: borderSide != null ? Border.fromBorderSide(borderSide!) : null,
        shape: shape,
      );
    }

    // Create the container with responsive properties
    Widget container = Container(
      width: responsiveWidth,
      height: responsiveHeight,
      margin: margin ?? ResponsiveHelper.getPadding(context),
      padding: padding,
      alignment: alignment,
      decoration: decoration,
      child: child,
    );

    // Add elevation if specified
    if (elevation != null) {
      container = Card(
        elevation: elevation!,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: decoration?.borderRadius != null
            ? RoundedRectangleBorder(borderRadius: decoration!.borderRadius!)
            : null,
        child: container,
      );
    }

    return container;
  }
}

/// A responsive text widget that uses ScreenUtil for font sizing
class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? fontSizeMultiplier;

  const ResponsiveText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.fontSizeMultiplier = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    // Use ScreenUtil for font sizing while allowing multiplier for responsiveness
    final baseFontSize = style?.fontSize ?? 16.0;
    final responsiveFontSize = baseFontSize * fontSizeMultiplier!;

    return Text(
      text,
      style: style?.copyWith(fontSize: responsiveFontSize),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
