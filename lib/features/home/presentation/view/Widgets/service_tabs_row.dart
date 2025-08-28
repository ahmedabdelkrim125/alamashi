import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/categories_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ServiceTabsRow extends StatelessWidget {
  const ServiceTabsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
    );
  }
}
