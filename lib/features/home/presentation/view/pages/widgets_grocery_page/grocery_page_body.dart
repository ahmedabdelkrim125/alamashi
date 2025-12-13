import 'dart:developer';
import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/Widgets/products_carousel_pages.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/Widgets/custom_app_bar.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/widgets_grocery_page/section_title.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/widgets_grocery_page/view_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GroceryPageBody extends StatelessWidget {
  const GroceryPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          children: [
            CustomAppBar(
              title: 'البقالة',
              onPressed: () {
                context.push(AppRouter.kSearch);
              },
            ),
            SizedBox(height: 24),
            SectionTitle(title: 'الأطعمة المجمدة'),
            SizedBox(height: 16),
            SizedBox(
              height: 245,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: ProductsCarouselPages(
                      image: Assets.rectangle,
                      title: 'بسلة مجمدة',
                      size: '330 مل',
                      price: '15',
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24),
            SectionTitle(title: 'الزيوت والدهون'),
            SizedBox(height: 16),
            SizedBox(
              height: 245,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      spacing: 12,
                      children: [
                        ProductsCarouselPages(
                          image: Assets.rectangle_1,
                          title: 'زيت دوار الشمس نور',
                          size: '330 مل',
                          price: '15',
                        ),
                        ProductsCarouselPages(
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
            SizedBox(height: 24),
            SectionTitle(title: 'الأطعمة الخفيفة'),
            SizedBox(height: 16),
            SizedBox(
              height: 245,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      spacing: 12,
                      children: [
                        ProductsCarouselPages(
                          image: Assets.rectangle_3,
                          title: 'V cola',
                          size: '330 مل',
                          price: '15',
                        ),
                        ProductsCarouselPages(
                          image: Assets.rectangle_4,
                          title: 'سبيدز كرافت',
                          size: '1 جم ',
                          price: '15',
                        ),
                        ProductsCarouselPages(
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
            SizedBox(height: 24),
            SectionTitle(title: 'الأطعمة الخفيفة'),
            SizedBox(height: 16),
            SizedBox(
              height: 245,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      spacing: 12,
                      children: [
                        ProductsCarouselPages(
                          image: Assets.rectangle_6,
                          title: 'حمص معلب',
                          size: '1 كجم',
                          price: '15',
                        ),
                        ProductsCarouselPages(
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
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 36,
              children: [
                ViewCartButton(
                  onTap: () {
                    log("فتح السلة");
                  },
                ),
                InkWell(onTap: () {}, child: Image.asset(Assets.frame)),
              ],
            ),
          ],
        );
      },
    );
  }
}
