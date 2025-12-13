import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/custom_text_field_home.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final verticalPadding = isTablet ? 35.0 : 25.0;
        final topSpacing = isTablet ? 25.0 : 16.0;
        final horizontalPadding = isTablet ? 25.0 : 16.0;

        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: verticalPadding),
            child: Column(
              children: [
                SizedBox(height: topSpacing),
                CustomTextFieldHome(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: RemoveAll(title: 'مسح السجل'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RemoveAll extends StatelessWidget {
  final String title;

  const RemoveAll({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final horizontalPadding = isTablet ? 25.0 : 16.0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: Style.textStyle13.copyWith(
                fontFamily: cairoMedium,
                color: ThemeColor.charcoalGrey,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        );
      },
    );
  }
}
