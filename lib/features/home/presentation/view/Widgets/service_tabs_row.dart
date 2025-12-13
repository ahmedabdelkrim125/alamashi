import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/categories_section.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServiceTabsRow extends StatelessWidget {
  const ServiceTabsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final height = isTablet ? 150.0 : 120.0;
        final spacing = isTablet ? 15.0 : 8.0;

        return SizedBox(
          height: height,
          child: ListView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            children: [
              Row(
                spacing: spacing,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: ThemeColor.charcoal),
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     child:
                  //   ),
                  // ),
                  CustomTab(
                    text: 'اسماك',
                    svgAsset: Assets.fishing,
                    onTap: () {
                      context.push(AppRouter.kFishPage);
                    },
                  ),
                  CustomTab(
                    text: 'لحوم',
                    svgAsset: Assets.woof,
                    onTap: () {
                      context.push(AppRouter.kMeatPage);
                    },
                  ),
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
            ],
          ),
        );
      },
    );
  }
}
