import 'dart:developer';

import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/core/utils/show_snackbar.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/Custom_Widgets/cutom_button.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/forget_passwor_widgets/forget_passwor_field.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/forget_passwor_widgets/forget_password_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginForgetPasswordPageBody extends StatefulWidget {
const  LoginForgetPasswordPageBody({super.key});

  @override
  State<LoginForgetPasswordPageBody> createState() => _LoginForgetPasswordPageBodyState();
}

class _LoginForgetPasswordPageBodyState extends State<LoginForgetPasswordPageBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

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
            ForgotPasswordHeader(),
            ForgetPassworField(
              controller: emailController,
            ),
            SizedBox(height: 100.h),
            CutomButton(
              textButton: 'إرسال',
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  log('إرسال طلب لـ: ${emailController.text}');

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => AlertDialog(
                      backgroundColor: ThemeColor.bgColor,
                      content: Row(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(width: 16),
                          Text("...جاري إرسال الكود"),
                        ],
                      ),
                    ),
                  );
                  await Future.delayed(Duration(seconds: 3));
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                  showCustomSnackBar(
                    context: context,
                    message: 'تم إرسال رابط إعادة التعيين بنجاح',
                    isError: false,
                  );
                  await Future.delayed(Duration(seconds: 2));
                  if (context.mounted) {
                    context.go(AppRouter.kConfirmCode);
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
