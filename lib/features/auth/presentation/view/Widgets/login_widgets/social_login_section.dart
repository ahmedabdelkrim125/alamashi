import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login_widgets/social_login_icon.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final width = isTablet ? 120.0 : 98.0;
        final height1 = isTablet ? 60.0 : 50.0;
        final height2 = isTablet ? 60.0 : 50.57;
        final height3 = isTablet ? 60.0 : 50.0;
        final spacing = isTablet ? 15.0 : 10.0;

        return Column(
          spacing: spacing,
          children: [
            /// Scrollable Row for social icons
            Row(
              spacing: spacing,
              children: [
                /// Custom Widget for Social Login Icon
                Expanded(
                  child: SocialLoginIcon(
                    iconPath: Assets.imagesFacebookLogo,
                    width: width,
                    height: height1,
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: SocialLoginIcon(
                    iconPath: Assets.imagesGoogleLogo,
                    width: width,
                    height: height2,
                    onTap: () {
                      // context.read<AuthCubit>().loginWithGoogle();
                    },
                  ),
                ),
                Expanded(
                  child: SocialLoginIcon(
                    iconPath: Assets.imagesAppleogo,
                    width: width,
                    height: height3,
                    onTap: () {},
                  ),
                ),
              ],
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
            ),
          ],
        );
      },
    );
  }
}
