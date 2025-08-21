import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/account/presentation/view/account_page.dart';
import 'package:egyptian_supermaekat/features/favorites/presentation/view/favorites_page.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/home_page.dart';
import 'package:egyptian_supermaekat/features/main/presentation/viewmodel/navigation_cubit.dart';
import 'package:egyptian_supermaekat/features/orders/presentation/view/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:svg_flutter/svg.dart';

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({
    super.key,
  });

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const FavoritesPage(),
    const OrdersPage(),
    const AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: _pages,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: ThemeColor.bgColor, boxShadow: [
              BoxShadow(
                blurRadius: 20,
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(.1),
              )
            ]),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  activeColor: ThemeColor.primaryGreenColor,
                  tabBackgroundColor:
                      // ignore: deprecated_member_use
                      ThemeColor.primaryGreenColor.withOpacity(0.1),
                  padding: const EdgeInsets.all(16),
                  selectedIndex: selectedIndex,
                  onTabChange: (index) {
                    context.read<NavigationCubit>().changeIndex(index);
                  },
                  gap: 8,
                  textStyle: Style.textStyle12.copyWith(
                    fontFamily: cairoRegular,
                    color: ThemeColor.primaryGreenColor,
                  ),
                  tabs: [
                    GButton(
                      icon: Icons.storefront_outlined,
                      leading: SvgPicture.asset(
                        Assets.ichome,
                        width: 18.w,
                        height: 18.h,
                        colorFilter: ColorFilter.mode(
                          selectedIndex == 0
                              ? ThemeColor.primaryGreenColor
                              : ThemeColor.neutralGrayColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      text: 'الرئيسية',
                    ),
                    GButton(
                      icon: Icons.storefront_outlined,
                      leading: SvgPicture.asset(
                        Assets.icorders,
                        width: 14.w,
                        height: 14.h,
                        colorFilter: ColorFilter.mode(
                          selectedIndex == 1
                              ? ThemeColor.primaryGreenColor
                              : ThemeColor.neutralGrayColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      text: 'طلباتي',
                    ),
                    GButton(
                      icon: Icons.storefront_outlined,
                      leading: SvgPicture.asset(
                        Assets.icfavorites,
                        width: 14.w,
                        height: 14.h,
                        colorFilter: ColorFilter.mode(
                          selectedIndex == 2
                              ? ThemeColor.primaryGreenColor
                              : ThemeColor.neutralGrayColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      text: 'المفضلة',
                    ),
                    GButton(
                      icon: Icons.storefront_outlined,
                      leading: SvgPicture.asset(
                        Assets.icaccount,
                        width: 14.w,
                        height: 14.h,
                        colorFilter: ColorFilter.mode(
                          selectedIndex == 3
                              ? ThemeColor.primaryGreenColor
                              : ThemeColor.neutralGrayColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      text: 'حسابي',
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
