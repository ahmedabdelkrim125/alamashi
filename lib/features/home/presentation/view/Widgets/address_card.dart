import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final containerHeight = isTablet ? 110.0 : 90.0;
        final borderRadius = isTablet ? 16.0 : 12.0;
        final imageWidth = isTablet ? 110.0 : 90.0;
        final horizontalPadding = isTablet ? 12.0 : 8.0;
        final verticalPadding = isTablet ? 8.0 : 6.0;
        final spacing = isTablet ? 6.0 : 4.0;

        return Container(
          height: containerHeight, // نفس المقاس
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: ThemeColor.lavenderGray, width: 2),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                ),
                child: SizedBox(
                  width: imageWidth,
                  height: double.infinity,
                  child: SvgPicture.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: Style.textStyle12.copyWith(
                            fontFamily: cairoBold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: spacing),
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
      },
    );
  }
}
