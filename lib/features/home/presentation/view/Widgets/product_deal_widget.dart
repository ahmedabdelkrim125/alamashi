import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductDealWidget extends StatelessWidget {
  const ProductDealWidget({super.key, required this.product});
  final Product product;
  Widget _buildTag({required String text, required Color color}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.r),
          bottomLeft: Radius.circular(8.r),
        ),
      ),
      child: Text(
        text,
        style: Style.textStyle14.copyWith(
          fontFamily: cairoMedium,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildConditionalTag() {
    if (!product.isAvailable) {
      return _buildTag(color: ThemeColor.forestGreenColor, text: 'غير متوفر');
    }
    if (product.discountPercentage != null && product.discountPercentage! > 0) {
      return _buildTag(
          color: ThemeColor.orangeAccentColor,
          text: '%وفر${product.discountPercentage}');
    }
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Container(
        width: 163.w,
        // height: 265.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ThemeColor.charcoalColor.withOpacity(.1),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(4, 4),
            ),
          ],
          color: ThemeColor.bgColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.w),
                    child: Stack(
                      children: [
                        Container(
                          width: 150.w,
                          height: 150.h,
                          decoration: BoxDecoration(
                            color: ThemeColor.lightSilver,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Center(
                            child: Image.network(
                              product.imageUrl,
                              width: 146.92.w,
                              height: 119.w,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: _buildConditionalTag(),
                        ),
                        Positioned(
                          top: 2.h,
                          left: 8.w,
                          child: CircleAvatar(
                            backgroundColor: ThemeColor.white,
                            radius: 13.r,
                            child: Image.asset(
                              Assets.favorites,
                              width: 15.w,
                            ),
                          ),
                        ),
                      ],
                    )
                    //Edting here //
                    ),
                Positioned(
                  top: 90.h,
                  right: -25.w,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      Assets.add,
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.w, 4.h, 8.w, 8.h),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround, // توزيع العناصر
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8.h,
                  children: [
                    Row(
                      spacing: 18.22.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          spacing: 4.w,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(Assets.ratingStarIcon),
                            Text(
                              product.rating.toString(),
                              style: Style.textStyle14.copyWith(
                                fontFamily: cairoSemiBold,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            product.name,
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Style.textStyle14.copyWith(
                              fontFamily: cairoRegular,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'حوالي 8 - 12 قطعه',
                        style: Style.textStyle14.copyWith(
                          color: ThemeColor.darkGrayTextColor,
                          fontFamily: cairoRegular,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ' ج .م',
                          style: Style.textStyle14.copyWith(
                            fontFamily: cairoBold,
                          ),
                        ),
                        Text(
                          product.price.toString(),
                          style: Style.textStyle14.copyWith(
                            fontFamily: cairoBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
