import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.image, required this.headline});
  final String image;
  final String headline;

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery for responsive layout while keeping ScreenUtil for fonts
    final isTablet = ResponsiveHelper.isTablet(context);
    final imageHeight = isTablet
        ? MediaQuery.of(context).size.height * .5
        : MediaQuery.of(context).size.height * .4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          image,
          height: imageHeight, // Using MediaQuery for layout sizing
        ),
        const Spacer(flex: 1),
        Text(
          headline,
          textAlign: TextAlign.center,
          style: Style.textStyle18.copyWith(
            fontFamily: cairoMedium,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        const Spacer(flex: 3),
      ],
    );
  }
}
