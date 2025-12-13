import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'address_card.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';

class StaticAddressRowCards extends StatelessWidget {
  const StaticAddressRowCards({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final spacing = isTablet ? 20.0 : 16.48;

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
            SizedBox(width: spacing),
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
      },
    );
  }
}
