import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'address_card.dart'; // استدعي AddressCard من مكانه

class AddressRowCards extends StatelessWidget {
  final List<AddressCard> cards;

  const AddressRowCards({
    super.key,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < cards.length; i++) ...[
            SizedBox(
              width: 0.8.sw, // كل كارت ياخد 80% من عرض الشاشة
              child: cards[i],
            ),
            if (i != cards.length - 1) SizedBox(width: 10.w),
          ],
        ],
      ),
    );
  }
}
