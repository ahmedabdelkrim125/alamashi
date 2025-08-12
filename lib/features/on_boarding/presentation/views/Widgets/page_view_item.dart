import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.headline,
  });
  final String image;
  final String headline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          image,
          height: MediaQuery.of(context).size.height * .3,
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
