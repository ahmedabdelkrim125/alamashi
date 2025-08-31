import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/custom_text_field_home.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/home_app_bar.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/product_deal_widget.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/promo_banner.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/section_title.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/service_tabs_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          //   child: StaticAddressRowCards(),
          // ),
          // SizedBox(height: 24.h),
          SectionTitle(title: 'تسوّق حسب الفئة'),
          SizedBox(height: 16.h),
          ServiceTabsRow(),
          SizedBox(height: 24.h),
          SectionTitle(title: 'عروض اليوم'),
          SizedBox(height: 12.h),
          SizedBox(
            height: 120.h,
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductDealWidget(),
            ),
          ),
          SizedBox(height: 24.h),
          PromoBanner(),
          SizedBox(height: 24.h),
          SectionTitle(title: 'الأفضل مبيعاَ بالقرب منك'),
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
                  child: ProductsCarousel(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

//products_carousel.dart

class ProductsCarousel extends StatelessWidget {
  const ProductsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      height: 245.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ThemeColor.charcoalColor.withOpacity(.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 6),
          ),
        ],
        color: ThemeColor.bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 160.w,
                height: 141.h,
                decoration: BoxDecoration(
                  color: ThemeColor.grayColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Center(
                  //هنا
                  child: Image.asset(
                    Assets.image444,
                    width: 146.92.w,
                    height: 119.w,
                  ),
                ),
              ),
              Positioned(
                top: 80.h,
                right: -20.w,
                child: InkWell(
                  onTap: () {
                   
                  },
                  child: Image.asset(
                    Assets.add,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 14.h),
          
          Text(
            'لوكر بسكويت',
            style: Style.textStyle14.copyWith(
              fontFamily: cairoSemiBold,
            ),
          ),
          Row(
            spacing: 8.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.ratingStarIcon),
              Text(
                '4.8 (287)',
                style: Style.textStyle14.copyWith(
                  fontFamily: cairoSemiBold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' ج .م',
                style: Style.textStyle12.copyWith(
                  fontFamily: cairoBold,
                ),
              ),
              Text(
                '15',
                style: Style.textStyle12.copyWith(
                  fontFamily: cairoBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
