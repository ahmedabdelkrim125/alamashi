import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDealWidget extends StatelessWidget {
  const ProductDealWidget({super.key, required this.product});
  final Product product;

  Widget _buildTag({required String text, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
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
        text: '%وفر${product.discountPercentage}',
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveHelper.isTablet(context);
    final containerWidth = isTablet ? 200.0 : 163.0;
    final borderRadius = isTablet ? 16.0 : 12.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        width: containerWidth,
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
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Image and tags stack
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: ThemeColor.lightSilver,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Image.network(
                            product.imageUrl,
                            width: 146.92,
                            height: 119,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: _buildConditionalTag(),
                      ),
                      Positioned(
                        top: 2,
                        left: 8,
                        child: CircleAvatar(
                          backgroundColor: ThemeColor.white,
                          radius: 13,
                          child: Image.asset(
                            Assets.favorites,
                            width: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 90,
                  right: -25,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      Assets.add,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),

            // Details section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First row: rating + name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Rating
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(Assets.ratingStarIcon),
                            const SizedBox(width: 4),
                            Text(
                              product.rating.toString(),
                              style: Style.textStyle14.copyWith(
                                fontFamily: cairoSemiBold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 18.22),

                        // Name (take remaining space)
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

                    const SizedBox(height: 8),

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

                    const SizedBox(height: 6),

                    // Price row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ' ج .م',
                          style: Style.textStyle14.copyWith(
                            fontFamily: cairoBold,
                          ),
                        ),
                        const SizedBox(width: 6),
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
