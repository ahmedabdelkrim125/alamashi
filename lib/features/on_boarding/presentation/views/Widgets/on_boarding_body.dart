import 'package:dots_indicator/dots_indicator.dart';
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:egyptian_supermaekat/features/on_boarding/presentation/views/Widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final PageController _pageController = PageController();

  double _currentPageIndex = 0.0;
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = _pageController.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final horizontalPadding = isTablet ? 30.0 : 19.0;
        final verticalPadding = isTablet ? 40.0 : 30.0;
        final skipButtonTopPadding = isTablet ? 70.0 : 60.0;
        final buttonHorizontalPadding = isTablet ? 35.0 : 24.0;
        final buttonVerticalPadding = isTablet ? 25.0 : 16.0;
        final buttonWidth = isTablet ? 400.0 : 343.0;
        final buttonHeight = isTablet ? 60.0 : 48.0;
        final spacing = isTablet ? 15.0 : 8.0;

        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      context.go(AppRouter.kLogin);
                    },
                    child: Text(
                      'تخطي',
                      style: Style.textStyle18.copyWith(
                        fontFamily: cairoMedium,
                        color: ThemeColor.bgColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    PageViewItem(
                      headline: 'كل احتياجات بيتك من مكان واحد',
                      image: Assets.onlineShoppingVector,
                    ),
                    PageViewItem(
                      headline: 'توصيل سريع لحد باب بيتك',
                      image: Assets.fastDeliveryVector,
                    ),
                    PageViewItem(
                      headline: 'طرق دفع آمنة ومتنوعة',
                      image: Assets.securePaymentVector,
                    ),
                  ],
                ),
              ),
              DotsIndicator(
                dotsCount: 3,
                position: _currentPageIndex,
                decorator: const DotsDecorator(
                  color: ThemeColor.lightGrayColor,
                  activeColor: ThemeColor.primaryGreenColor,
                  size: Size.square(10),
                  activeSize: Size(24.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
              ),
              SizedBox(height: skipButtonTopPadding),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: buttonHorizontalPadding,
                  vertical: buttonVerticalPadding,
                ),
                child: Row(
                  children: [
                    Visibility(
                      visible: _currentPageIndex > 0,
                      maintainSize: false,
                      maintainAnimation: true,
                      maintainState: true,
                      child: IconButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        icon: SvgPicture.asset(Assets.backArrowCircle),
                      ),
                    ),
                    SizedBox(width: spacing),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (_currentPageIndex < 2) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          } else if (_currentPageIndex == 2) {
                            context.go(AppRouter.kLogin);
                          }
                        },
                        child: Container(
                          width: buttonWidth,
                          height: buttonHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              colors: [
                                ThemeColor.forestGreenColor,
                                ThemeColor.primaryGreenColor,
                              ],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'التالي',
                              textAlign: TextAlign.center,
                              style: Style.textStyle14.copyWith(
                                fontFamily: cairoSemiBold,
                                fontWeight: FontWeight.w600,
                                color: ThemeColor.bgColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
