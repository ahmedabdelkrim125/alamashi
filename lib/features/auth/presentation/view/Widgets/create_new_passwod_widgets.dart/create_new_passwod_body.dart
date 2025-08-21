import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/create_new_passwod_widgets.dart/create_new_passwod_header.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/create_new_passwod_widgets.dart/create_new_password_button.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/create_new_passwod_widgets.dart/create_new_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CreateNewPasswodBody extends StatefulWidget {
  const CreateNewPasswodBody({super.key});

  @override
  State<CreateNewPasswodBody> createState() => _CreateNewPasswodBodyState();
}

class _CreateNewPasswodBodyState extends State<CreateNewPasswodBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SvgPicture.asset(
              Assets.imagesLogo,
              width: 107.w,
              height: 100.35.h,
            ),
            SizedBox(height: 79.65.h),
            CreateNewPasswodHeader(),
            CreateNewPasswodField1(
              controller: passwordController,
              textLable: 'كلمة المرور الجديده ',
              texthit: 'كلمة المرور الجديده ',
            ),
            ReCreateNewPasswodField(
              passwordController: passwordController,
              recontroller: confirmPasswordController,
              textLable: 'تأكيد كلمة المرور الجديده ',
              texthit: 'تأكيد كلمة المرور الجديده ',
            ),
            CreateNewPasswordButton(
              formKey: _formKey,
              passwordController: passwordController,
            ),
          ],
        ),
      ),
    );
  }
}
