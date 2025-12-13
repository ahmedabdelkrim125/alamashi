import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/Custom_Widgets/create_account_title.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_body_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = ResponsiveHelper.isTablet(context);
            final verticalPadding = isTablet ? 32.0 : 24.0;
            final horizontalPadding = isTablet ? 24.0 : 16.0;
            final spacing = isTablet ? 32.0 : 24.0;
            final iconSize = isTablet ? 30.0 : 24.0;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              child: Column(
                spacing: spacing,
                children: [
                  CreateAccountTitle(
                    title: 'إنشاء حساب',
                    iconButton: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      icon: SvgPicture.asset(
                        Assets.chevronRight,
                        width: iconSize,
                        height: iconSize,
                      ),
                    ),
                  ),
                  SignUpBodyPage(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
