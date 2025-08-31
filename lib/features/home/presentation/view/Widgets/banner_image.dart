import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.groceryBasket,
    );
  }
}