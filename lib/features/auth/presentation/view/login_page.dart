import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/create_account_title.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login_widgets/login_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
          child: Column(
            spacing: 24.h,
            children: [
              const CreateAccountTitle(
                title: 'تسجيل الدخول',
                
              ),
              LoginPageBody(),
            ],
          ),
        ),
      ),
    );
  }
}
