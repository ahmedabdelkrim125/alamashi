import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String street1;
  final String street2;
  final String imagePath;

  const AddressCard({
    super.key,
    required this.title,
    required this.street1,
    required this.street2,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h, // نفس المقاس
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: ThemeColor.lavenderGray, width: 2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
            child: SizedBox(
              width: 90.w,
              height: double.infinity,
              child: SvgPicture.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Style.textStyle12.copyWith(fontFamily: cairoBold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Flexible(
                    child: Text(
                      street1,
                      textAlign: TextAlign.center,
                      style: Style.textStyle12,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      street2,
                      textAlign: TextAlign.center,
                      style: Style.textStyle12,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



