import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.createAccountText,
      required this.noAccountText,
      required this.routerPage});
  final String createAccountText; //انشاء
  final String noAccountText;
  // ignore: prefer_typing_uninitialized_variables
  final routerPage;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/facebook_logo.svg',
                width: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/google_logo.svg',
                width: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/apple_logo.svg',
                width: 30,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                context.push(routerPage);
              },
              child: Text(
                createAccountText,
                style: Style.textStyle16.copyWith(
                  decoration: TextDecoration.underline,
                  fontFamily: cairoBold,
                  color: ThemeColor.primaryColor,
                ),
              ),
            ),
            Text(
              noAccountText,
              style: Style.textStyle16.copyWith(
                fontFamily: cairoRegular,
                color: ThemeColor.primaryColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
