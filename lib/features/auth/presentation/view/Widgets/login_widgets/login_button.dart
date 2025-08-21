import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/show_snackbar.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/Custom_Widgets/cutom_button.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return CutomButton(
      onTap: () {
        if (formKey.currentState!.validate()) {
          /// هنا تنده على Cubit
          context.read<AuthCubit>().login(
                emailController.text.trim(),
                passwordController.text.trim(),
              );
        } else {
          showCustomSnackBar(
            context: context,
            message: 'ادخل بيانات الحقول بشكل صحيح',
            backgroundColor: ThemeColor.errorColor,
          );
        }
      },
      textButton: 'تسجيل الدخول',
    );
  }
}
