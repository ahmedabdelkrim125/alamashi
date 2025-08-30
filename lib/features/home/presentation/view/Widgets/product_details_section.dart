import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'product_old_price.dart';
import 'product_new_price.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: 4.h,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'عبوةآيس كريم',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Style.textStyle14.copyWith(fontFamily: cairoBold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'قطع',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Style.textStyle14.copyWith(fontFamily: cairoBold),
                textDirection: TextDirection.ltr,
              ),
              Text(
                ' 5',
                style: Style.textStyle14.copyWith(fontFamily: cairoBold),
              )
            ],
          ),
          Row(
            spacing: 7.w,
            children: const [
              ProductNewPrice(),
              ProductOldPrice(),
            ],
          )
        ]);
  }
}
