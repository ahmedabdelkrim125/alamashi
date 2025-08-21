import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/Custom_Widgets/create_account_title.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_body_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
          child: Column(
            spacing: 24.h,
            children: [
              CreateAccountTitle(
                title: 'إنشاء حساب',
                iconButton: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset(
                    Assets.chevronRight,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
              SignUpBodyPage(),
            ],
          ),
        ),
      ),
    );
  }
}
