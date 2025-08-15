import 'package:flutter/material.dart';
import '../../../../../core/app_router.dart';
import '../widgets/social_login_section.dart';

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
