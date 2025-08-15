import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login/social_login_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({
    super.key,
    required this.createAccountText,
    required this.routerPage,
  });

  final String createAccountText; // انشاء
  final String routerPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        /// Scrollable Row for social icons
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 10,
            children: [
              /// Custom Widget for Social Login Icon
              SocialLoginIcon(
                iconPath: Assets.imagesFacebookLogo,
                width: 98.w,
                height: 50.h,
                onTap: () {},
              ),
              SocialLoginIcon(
                iconPath: Assets.imagesGmailLogo,
                width: 98.w,
                height: 50.57.h,
                onTap: () {},
              ),
              SocialLoginIcon(
                iconPath: Assets.imagesAppleogo,
                width: 98.w,
                height: 50.h,
                onTap: () {},
              ),
            ],
          ),
        ),

        /// Create account + No account text
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
                style: Style.textStyle14.copyWith(
                  decoration: TextDecoration.underline,
                  fontFamily: cairoSemiBold,
                  color: ThemeColor.charcoalColor,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
