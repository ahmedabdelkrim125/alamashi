import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/custom_text_field_home.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/home_app_bar.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/product_deal_widget.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/products_carousel_home.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/promo_banner.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/section_title.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/service_tabs_row.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/models/mock_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          HomeAppBar(),
          SizedBox(height: 17.5.h),
          CustomTextFieldHome(),
          SizedBox(height: 23.h),
          SectionTitle(title: 'تسوّق حسب الفئة'),
          SizedBox(height: 16.h),
          ServiceTabsRow(),
          SizedBox(height: 24.h),
          SectionTitle(title: 'العروض'),
          SizedBox(height: 12.h),
          SizedBox(
            height: 290.h,
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: mockProducts.length,
              itemBuilder: (context, index) => ProductDealWidget(
                product: mockProducts[index],
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PromoBanner(),
          ),
          SizedBox(height: 24.h),
          SectionTitle(title: 'الأفضل مبيعاَ بالقرب منك'),
          SizedBox(height: 16.h),
          SizedBox(
            height: 250.h,
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: ProductsCarouselHome(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
