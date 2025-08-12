import 'package:dots_indicator/dots_indicator.dart';
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/on_boarding/presentation/views/Widgets/page_view_item.dart';
import 'package:flutter/material.dart';

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
    _pageController.addListener(
      () {
        setState(
          () {
            _currentPageIndex = _pageController.page ?? 0;
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 41),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'تخطي',
                style: Style.textStyle18.copyWith(
                  fontFamily: cairoMedium,
                  color: Color(0xff4A4A4A),
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
              color: Color(0xffD9D9D9),
              activeColor: Color(0xff01AC66),
              size: Size.square(10),
              activeSize: Size(24.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
