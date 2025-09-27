
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        spacing: 16.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80.r,
            backgroundImage: AssetImage('assets/images/preson.jpg'),
          ),
          Text(
            'احمد عبدالكريم',
            style: Style.textStyle14.copyWith(
              fontFamily: cairoBold,
            ),
          ),
        ],
      ),
    );
  }
}
