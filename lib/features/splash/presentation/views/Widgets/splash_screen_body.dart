import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(flex: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.imagesLeafyChat,
              width: 250.sp,
            ),
          ],
        ),
        Spacer(flex: 2),
        SvgPicture.asset(
          Assets.imagesWaveStart,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
