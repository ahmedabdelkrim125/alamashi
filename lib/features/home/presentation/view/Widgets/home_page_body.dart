import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/categories_section.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/custom_text_field_home.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/home_app_bar.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/section_title.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/static_address_row_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const HomeAppBar(),
          SizedBox(height: 16.h),
          const CustomTextFieldHome(),
          SizedBox(height: 23.h),
          StaticAddressRowCards(),
          SizedBox(height: 24.h),
          SectionTitle(title: 'تسوّق حسب الفئة'),
          SizedBox(height: 16.h),
          CustomScrollView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10.w,
                  children: [
                    CustomTab(
                      text: 'الصيدلية',
                      svgAsset: Assets.iconPharmacy,
                      onTap: () {
                        context.push(AppRouter.kPharmacyPage);
                      },
                    ),
                    CustomTab(
                      text: 'منتجات الالبان',
                      svgAsset: Assets.iconDairy,
                      onTap: () {
                        context.push(AppRouter.kDairyPage);
                      },
                    ),
                    CustomTab(
                      text: 'البقالة',
                      svgAsset: Assets.iconGrocery,
                      onTap: () {
                        context.push(AppRouter.kGroceryPage);
                      },
                    ),
                    CustomTab(
                      text: 'فواكهة  وخضروات',
                      svgAsset: Assets.iconFruits,
                      onTap: () {
                        context.push(AppRouter.kFruitsPage);
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
