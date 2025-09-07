import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/Widgets/custom_text_field_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            CustomTextFieldHome(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: RemoveAll(
                  title: 'مسح السجل',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RemoveAll extends StatelessWidget {
  final String title;

  const RemoveAll({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
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
  }
}
