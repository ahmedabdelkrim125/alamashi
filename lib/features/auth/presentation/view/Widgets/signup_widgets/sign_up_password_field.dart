import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/custom_form_text_field.dart';

class SignUpPasswordField extends StatelessWidget {
  const SignUpPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
      prefix: SvgPicture.asset(
        Assets.eyeSlashIcon,
        height: 20.sp,
        width: 20.sp,
      ),
      textLable: 'كلمة السر',
      texthit: 'كلمة السر',
    );
  }
}
