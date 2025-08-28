import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'product_details_section.dart';


class ProductDealWidget extends StatelessWidget {
  const ProductDealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        width: 250.w,
        height: 320.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            width: 2,
            color: ThemeColor.primaryColor.withOpacity(.1),
          ),
        ),
        child: Center(
          child: Row(
            spacing: 10.w,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ProductDetailsSection(),
              ),
              ProductImage()
            ],
          ),
        ),
      ),
    );
  }
}

