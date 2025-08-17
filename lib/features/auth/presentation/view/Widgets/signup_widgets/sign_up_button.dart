import 'package:egyptian_supermaekat/features/auth/data/model/user_model/user.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/cutom_button.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  // Controllers
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController numberController;
  final TextEditingController passwordController;

  const SignUpButton(
      {super.key,
      required this.formKey,
      required this.emailController,
      required this.nameController,
      required this.numberController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return CutomButton(
      onTap: () {
        if (formKey.currentState!.validate()) {
          final user = User(
            userName: nameController.text,
            email: emailController.text,
            phone: numberController.text,
          );

          final password = passwordController.text;

          context.read<AuthCubit>().signup(user, password);
        }
      },
      textButton: 'انشاء حساب',
    );
  }
}
