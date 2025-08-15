import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login_widgets/social_login_section.dart';
import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/core/app_router.dart';

class SignUpSocialSection extends StatelessWidget {
  const SignUpSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialLoginSection(
      routerPage: AppRouter.login,
      createAccountText: 'هل تمتلك حساب بالفعل ؟ ',
    );
  }
}