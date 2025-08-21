
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/confirm_code_widgets/confirm_code_button.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/confirm_code_widgets/confirm_code_fields.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/confirm_code_widgets/confirm_code_header.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/confirm_code_widgets/resend_code_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmCodePageBody extends StatefulWidget {
  const ConfirmCodePageBody({super.key});

  @override
  State<ConfirmCodePageBody> createState() => _ConfirmCodePageBodyState();
}

class _ConfirmCodePageBodyState extends State<ConfirmCodePageBody> {
  final TextEditingController emailController = TextEditingController();
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SvgPicture.asset(
              Assets.imagesLogo,
              width: 107.w,
              height: 100.35.h,
            ),
            SizedBox(height: 79.65.h),
            ConfirmCodeHeader(),
            ConfirmCodeFields(
                focusNode: focusNode, pinController: pinController),
            SizedBox(
              height: 16.h,
            ),
            ResendCodeButton(onPressed: () {}),
            SizedBox(height: 100.h),
            ConfirmCodeButton(
              //محتاجين يتغيرو
              formKey: formKey,
              pinController: TextEditingController(),
            )
          ],
        ),
      ),
    );
  }
}
//
