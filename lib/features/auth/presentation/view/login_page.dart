import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/Custom_Widgets/create_account_title.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login_widgets/login_page_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              child: Column(
                spacing: spacing,
                children: [
                  const CreateAccountTitle(title: 'تسجيل الدخول'),
                  LoginPageBody(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
