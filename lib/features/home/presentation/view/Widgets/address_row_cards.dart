import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'address_card.dart'; // استدعي AddressCard من مكانه

class AddressRowCards extends StatelessWidget {
  final List<AddressCard> cards;

  const AddressRowCards({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final cardWidth = constraints.maxWidth * 0.8;
        final spacing = isTablet ? 15.0 : 10.0;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < cards.length; i++) ...[
                SizedBox(
                  width: cardWidth, // كل كارت ياخد 80% من عرض الشاشة
                  child: cards[i],
                ),
                if (i != cards.length - 1) SizedBox(width: spacing),
              ],
            ],
          ),
        );
      },
    );
  }
}
