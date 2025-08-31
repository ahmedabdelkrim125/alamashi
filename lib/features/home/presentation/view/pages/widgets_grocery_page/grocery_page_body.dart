import 'dart:developer';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/section_title.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/Widgets/products_carousel.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/widgets_grocery_page/custom_app_bar.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/widgets_grocery_page/view_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GroceryPageBody extends StatelessWidget {
  const GroceryPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomAppBar(
          title: 'البقالة',
          iconButton: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              Assets.chevronRight,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        SectionTitle(title: 'الأطعمة المجمدة'),
        SizedBox(height: 16.h),
        SizedBox(
          height: 245.h,
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: ProductsCarousel(
                  image: Assets.rectangle,
                  title: 'بسلة مجمدة',
                  size: '330 مل',
                  price: '15',
                ),
              );
            },
          ),
        ),
        SizedBox(height: 24.h),
        SectionTitle(title: 'الزيوت والدهون'),
        SizedBox(height: 16.h),
        SizedBox(
          height: 245.h,
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Row(
                  spacing: 12.w,
                  children: [
                    ProductsCarousel(
                      image: Assets.rectangle_1,
                      title: 'زيت دوار الشمس نور',
                      size: '330 مل',
                      price: '15',
                    ),
                    ProductsCarousel(
                      image: Assets.rectangle_2,
                      title: 'سمنة جنة',
                      size: '330 مل',
                      price: '15',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 24.h),
        SectionTitle(title: 'الأطعمة الخفيفة'),
        SizedBox(height: 16.h),
        SizedBox(
          height: 245.h,
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Row(
                  spacing: 12.w,
                  children: [
                    ProductsCarousel(
                      image: Assets.rectangle_3,
                      title: 'V cola',
                      size: '330 مل',
                      price: '15',
                    ),
                    ProductsCarousel(
                      image: Assets.rectangle_4,
                      title: 'سبيدز كرافت',
                      size: '1 جم ',
                      price: '15',
                    ),
                    ProductsCarousel(
                      image: Assets.rectangle_5,
                      title: 'سبيدز كرافت',
                      size: '1 جم ',
                      price: '15',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 24.h),
        SectionTitle(title: 'الأطعمة الخفيفة'),
        SizedBox(height: 16.h),
        SizedBox(
          height: 245.h,
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Row(
                  spacing: 12.w,
                  children: [
                    ProductsCarousel(
                      image: Assets.rectangle_6,
                      title: 'حمص معلب',
                      size: '1 كجم',
                      price: '15',
                    ),
                    ProductsCarousel(
                      image: Assets.rectangle_7,
                      title: 'سمنة جنة',
                      size: '1 كجم',
                      price: '15',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 36.w,
          children: [
            ViewCartButton(
              onTap: () {
                log("فتح السلة");
              },
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(Assets.frame),
            ),
          ],
        )
      ],
    );
  }
}

