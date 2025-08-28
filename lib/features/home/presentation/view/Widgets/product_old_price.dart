import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';


class ProductOldPrice extends StatelessWidget {
  const ProductOldPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$18',
      style: Style.textStyle16.copyWith(
        fontFamily: cairoSemiBold,
        decoration: TextDecoration.lineThrough,
        color: ThemeColor.onyx,
      ),
    );
  }
}

