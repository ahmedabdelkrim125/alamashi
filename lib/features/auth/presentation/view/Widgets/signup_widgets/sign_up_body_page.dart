import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_button.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_form_fields.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_header.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_social_section.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpBodyPage extends StatelessWidget {
  SignUpBodyPage({super.key});
  final _formKey = GlobalKey<FormState>();
  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
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
          context.go(AppRouter.login);
        } else if (state is AuthFailure) {
          Navigator.pop(context); // 🔙 قفل الـ Dialog
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SignUpHeader(),
                SignUpFormFields(
                  controllerEmailField: emailController,
                  controllerPasswordField: passwordController,
                  controllerNameField: nameController,
                  controllerNumberField: numberController,
                ),
                SignUpButton(
                  formKey: _formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  nameController: nameController,
                  numberController: numberController,
                ),
                const SizedBox(height: 10),
                const SignUpSocialSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}
