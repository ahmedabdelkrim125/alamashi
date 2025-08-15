import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login/login_button.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login/login_email_field.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login/login_forget_password.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login/login_header.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login/login_or_divider.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login/login_password_field.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login/login_social_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPageBody extends StatelessWidget {
  LoginPageBody({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LoginHeader(),
              const LoginEmailField(),
              const LoginPasswordField(),
              LoginButton(formKey: _formKey),
              SizedBox(height: 10.sp),
              const LoginForgetPassword(),
              SizedBox(height: 27.h),
              const LoginOrDivider(),
              SizedBox(height: 12.h),
              const LoginSocialSection(),
            ],
          ),
        ),
      ),
    );
  }
}
