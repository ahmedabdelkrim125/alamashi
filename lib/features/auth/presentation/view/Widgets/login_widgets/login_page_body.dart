import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/show_snackbar.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login_widgets/login_button.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login_widgets/login_email_field.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login_widgets/login_forget_password.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login_widgets/login_header.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login_widgets/login_or_divider.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login_widgets/login_password_field.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/login_widgets/login_social_section.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPageBody extends StatelessWidget {
  LoginPageBody({super.key});
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => AlertDialog(
                backgroundColor: ThemeColor.bgColor,
                content: Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 16),
                    Text("...جاري تسجيل الدخول"),
                  ],
                ),
              ),
            );
          } else if (state is AuthSuccess) {
            Navigator.pop(context);
            context.go(AppRouter.kMain);
          } else if (state is AuthFailure) {
            Navigator.pop(context);
            showCustomSnackBar(
              context: context,
              message: state.message,
              isError: true,
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const LoginHeader(),
                  LoginEmailField(controller: emailController),
                  LoginPasswordField(
                    controller: passwordController,
                  ),
                  LoginButton(
                    formKey: _formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  SizedBox(height: 10.sp),
                  const ForgotPasswordLink(),
                  SizedBox(height: 27.h),
                  const LoginOrDivider(),
                  SizedBox(height: 12.h),
                  const LoginSocialSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
