import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:flutter/material.dart';

class LoginOrDivider extends StatelessWidget {
  const LoginOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(thickness: 2, indent: 16, endIndent: 16),
        ),
        Text(
          'أو',
          style: Style.textStyle16.copyWith(fontFamily: cairoSemiBold),
        ),
        Expanded(
          child: Divider(thickness: 2, indent: 16, endIndent: 16),
        ),
      ],
    );
  }
}
