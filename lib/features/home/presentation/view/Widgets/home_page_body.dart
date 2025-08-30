import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
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
          ),
          SizedBox(height: 24.h),
          PromoBanner(),
        ],
      ),
    );
  }
}

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 203.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: ThemeColor.charcoalColor.withOpacity(.3),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 6),
          ),
        ],
        color: ThemeColor.greenColor,
      ),
      child: Center(
        child: Row(
          children: [
            Image.asset(
              Assets.groceryBasket,
              width: 190.w,
              height: 118.h,
            ),
            Column(
              children: [
                Text(
                  '%' 'عروض تصل إلي 30',
                  style: Style.textStyle18.copyWith(
                    fontFamily: cairoBold,
                  ),
                ),
                // CutomButton(
                //   textButton: 'تسوق الأن',
                //   onTap: () {},
                //   svgPicture: SvgPicture.asset(
                //     Assets.shopping_,
                //     color: ThemeColor.bgColor,
                //   ),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
