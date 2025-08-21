import 'package:egyptian_supermaekat/core/utils/validators.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/Custom_Widgets/custom_form_text_field.dart';
import 'package:flutter/material.dart';

class CreateNewPasswodField1 extends StatelessWidget {
  const CreateNewPasswodField1(
      {super.key,
      required this.controller,
      required this.textLable,
      required this.texthit});
  // Controller
  final TextEditingController controller;
  final String textLable;
  final String texthit;
  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
      controller: controller,
      textLable: textLable,
      texthit: texthit,
      validator: AppValidators.validatePassword,
    );
  }
}



//حقل اعادة التاكيد

//ReCreateNewPasswodField 
class ReCreateNewPasswodField extends StatelessWidget {
  const ReCreateNewPasswodField(
      {super.key,
      required this.recontroller,
      required this.textLable,
      required this.texthit, required this.passwordController});
  // Controller
  final TextEditingController recontroller;
  final TextEditingController passwordController;
  final String textLable;
  final String texthit;
  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
      controller: recontroller,
      textLable: textLable,
      texthit: texthit,
      validator: (value) {
        return AppValidators.validateConfirmPassword(value, passwordController.text);
      },
      
    );
  }
}
