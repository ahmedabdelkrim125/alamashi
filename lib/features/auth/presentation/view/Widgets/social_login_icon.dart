
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginIcon extends StatelessWidget {
  final String iconPath;
  final double width;
  final double height;
  final VoidCallback onTap;

  const SocialLoginIcon({
    super.key,
    required this.iconPath,
    required this.width,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: SvgPicture.asset(
        iconPath,
        width: width,
        height: height,
      ),
    );
  }
}
