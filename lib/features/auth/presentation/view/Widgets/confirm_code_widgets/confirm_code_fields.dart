// lib/.../Widgets/confirm_code_widgets/confirm_code_fields.dart

import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:egyptian_supermaekat/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class ConfirmCodeFields extends StatelessWidget {
  const ConfirmCodeFields({
    super.key,
    required this.pinController,
    required this.focusNode,
  });

  final TextEditingController pinController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final pinWidth = isTablet ? 70.0 : 55.75;
        final pinHeight = isTablet ? 70.0 : 55.75;
        final fontSize = isTablet ? 26.0 : 22.0;
        final separatorWidth = isTablet ? 50.0 : 40.0;

        final defaultPinTheme = PinTheme(
          width: pinWidth,
          height: pinHeight,
          textStyle: TextStyle(fontSize: fontSize),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ThemeColor.darkGreenColor),
          ),
        );

        return Pinput(
          length: 4,
          controller: pinController,
          focusNode: focusNode,
          defaultPinTheme: defaultPinTheme,

          validator: AppValidators.confirmCode,
          separatorBuilder: (index) => SizedBox(width: separatorWidth),
        );
      },
    );
  }
}
