import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'address_card.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';

class StaticAddressRowCards extends StatelessWidget {
  const StaticAddressRowCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AddressCard(
            title: "عنوان المكتب:",
            street1: "شارع رقم 2456",
            street2: "شارع X12",
            imagePath: Assets.map_1,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: AddressCard(
            title: "عنوان الفرع:",
            street1: "شارع التحرير",
            street2: "المبنى 12",
            imagePath: Assets.map_1,
          ),
        ),
      ],
    );
  }
}
