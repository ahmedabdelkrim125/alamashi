import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_button.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_form_fields.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_header.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/signup_widgets/sign_up_social_section.dart';
import 'package:flutter/material.dart';

class SignUpBodyPage extends StatelessWidget {
  SignUpBodyPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SignUpHeader(),
            const SignUpFormFields(),
            SignUpButton(formKey: _formKey),
            const SizedBox(height: 10),
            const SignUpSocialSection(),
          ],
        ),
      ),
    );
  }
}
