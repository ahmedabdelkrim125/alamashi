import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';


class ProductNewPrice extends StatelessWidget {
  const ProductNewPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'ج.م ',
          style: Style.textStyle18.copyWith(
            fontFamily: cairoBold,
            color: ThemeColor.coralRed,
          ),
        ),
        Text(
          '12',
          style: Style.textStyle18.copyWith(
            fontFamily: cairoBold,
            color: ThemeColor.coralRed,
          ),
        ),
      ],
    );
  }
}