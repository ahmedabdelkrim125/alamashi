import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/shop_now_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerTextContent extends StatelessWidget {
  const BannerTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 32.h, // Kept as is from your original code
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '%' 'عروض تصل إلي 30',
          style: Style.textStyle18.copyWith(
            fontFamily: cairoBold,
          ),
        ),
        // This is now its own widget below
        const ShopNowButton(),
      ],
    );
  }
}