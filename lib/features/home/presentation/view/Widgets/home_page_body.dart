import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/custom_text_field_home.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/home_app_bar.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/product_deal_widget.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/section_title.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/service_tabs_row.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/static_address_row_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: StaticAddressRowCards(),
          ),
          SizedBox(height: 24.h),
          SectionTitle(title: 'تسوّق حسب الفئة'),
          SizedBox(height: 16.h),
          ServiceTabsRow(),
          SizedBox(height: 24.h),
          SectionTitle(title: 'عروض اليوم'),
          SizedBox(height: 12.h),
          SizedBox(
            height: 120.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductDealWidget(),
            ),
          )
        ],
      ),
    );
  }
}
