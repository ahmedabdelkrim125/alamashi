import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/account/presentation/view/account_page.dart';
import 'package:egyptian_supermaekat/features/Shopping_Cart/presentation/view/shopping_cart_page.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/home_page.dart';
import 'package:egyptian_supermaekat/features/main/presentation/viewmodel/navigation_cubit.dart';
import 'package:egyptian_supermaekat/features/orders/presentation/view/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:svg_flutter/svg.dart';

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  static final List<Widget> _pages = <Widget>[
    const HomePage(), // index 0
    const OrdersPage(), // index 1
    const ShoppingCartPage(), // index 2
    const AccountPage(), // index 3
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
            decoration: BoxDecoration(
              color: ThemeColor.secondaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: Directionality(
                  // 👈 هنا خليت الاتجاه RTL
                  textDirection: TextDirection.rtl,
                  child: GNav(
                    activeColor: ThemeColor.primaryGreenColor,
                    tabBackgroundColor:
                        ThemeColor.forestGreenColor.withOpacity(0.1),
                    padding: const EdgeInsets.all(16),
                    selectedIndex: selectedIndex,
                    onTabChange: (index) {
                      context.read<NavigationCubit>().changeIndex(index);
                    },
                    gap: 8,
                    textStyle: Style.textStyle14.copyWith(
                      fontFamily: cairoBold,
                      color: ThemeColor.forestGreenColor,
                    ),
                    tabs: [
                      GButton(
                        icon: Icons.home_outlined,
                        text: 'الرئيسية',
                        leading: SvgPicture.asset(
                          Assets.ichome,
                          width: 18.w,
                          height: 18.h,
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 0
                                ? ThemeColor.forestGreenColor
                                : ThemeColor.neutralGrayColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      GButton(
                        icon: Icons.list_alt_outlined,
                        text: 'طلباتي',
                        leading: SvgPicture.asset(
                          Assets.icorders,
                          width: 18.w,
                          height: 18.h,
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 1
                                ? ThemeColor.forestGreenColor
                                : ThemeColor.neutralGrayColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      GButton(
                        icon: Icons.shopping_cart_outlined,
                        text: 'السلة',
                        leading: SvgPicture.asset(
                          Assets.shoppingCartIcon,
                          width: 18.w,
                          height: 18.h,
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 2
                                ? ThemeColor.forestGreenColor
                                : ThemeColor.neutralGrayColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      GButton(
                        icon: Icons.person_outline,
                        text: 'حسابي',
                        leading: SvgPicture.asset(
                          Assets.icaccount,
                          width: 18.w,
                          height: 18.h,
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 3
                                ? ThemeColor.forestGreenColor
                                : ThemeColor.neutralGrayColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
