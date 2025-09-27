import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrdersPageBody extends StatelessWidget {
  const OrdersPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 50.h),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'طلباتك',
                  style: Style.textStyle16.copyWith(
                    color: ThemeColor.charcoalColor,
                    fontFamily: cairoMedium,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset(
                    Assets.chevronRight,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 72.h),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return DateOrder();
              },
              childCount: 10,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 8.h,
              mainAxisSpacing: 8.w,
              childAspectRatio: 2,
            ),
          ),
        )
      ],
    );
  }
}

class DateOrder extends StatelessWidget {
  const DateOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ThemeColor.charcoalColor.withOpacity(.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(4, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(5.r),
        color: Color(0xffe6f4ea),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: Column(
              spacing: 8.h,
              children: [
                Text(
                  '١٨٠ ج.م',
                  style: Style.textStyle18.copyWith(
                    fontFamily: cairoBold,
                  ),
                ),
                Text(
                  'تم الدفع',
                  style: Style.textStyle16.copyWith(
                    fontFamily: cairoMedium,
                    color: ThemeColor.charcoal,
                  ),
                ),
                Text(
                  '٥ منتجات',
                  style: Style.textStyle20.copyWith(
                    fontFamily: cairoMedium,
                    color: ThemeColor.charcoal,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              child: Column(
                spacing: 8.h,
                children: [
                  Text(
                    '#D752ab4',
                    style: Style.textStyle18.copyWith(
                      fontFamily: cairoMedium,
                      color: ThemeColor.charcoalColor,
                    ),
                  ),
                  Text(
                    '٢٧ أغسطس ٢٠٢٥ ،٦:٤٧م',
                    style: Style.textStyle16.copyWith(
                      fontFamily: cairoMedium,
                      color: ThemeColor.charcoalColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'يتم تجهيز',
                    style: Style.textStyle18.copyWith(
                      fontFamily: cairoMedium,
                      color: ThemeColor.orangeAccentColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
            child: Column(
              spacing: 8.h,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ThemeColor.charcoalColor.withOpacity(.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundImage: AssetImage(
                      'assets/images/preson.jpg',
                    ),
                  ),
                ),
                Text(
                  'احمد عبدالكريم',
                  style: Style.textStyle16.copyWith(
                    fontFamily: cairoSemiBold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
