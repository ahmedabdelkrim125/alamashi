import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/shop_now_button.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class BannerTextContent extends StatelessWidget {
  const BannerTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final spacing = isTablet ? 40.0 : 32.0;

        return Column(
          spacing: spacing,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '%'
              'عروض تصل إلي 30',
              style: Style.textStyle18.copyWith(fontFamily: cairoBold),
            ),
            // This is now its own widget below
            const ShopNowButton(),
          ],
        );
      },
    );
  }
}
