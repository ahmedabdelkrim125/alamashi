import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login_widgets/social_login_section.dart';
import 'package:flutter/material.dart';


class LoginSocialSection extends StatelessWidget {
  const LoginSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialLoginSection(
      routerPage: AppRouter.signUp,
      createAccountText: 'إنشاء حساب جديد',
    );
  }
}
