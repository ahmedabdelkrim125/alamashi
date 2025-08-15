import 'package:flutter/material.dart';
import '../../../../../core/style.dart';
import '../../../../../constant.dart';

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
