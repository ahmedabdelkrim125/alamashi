import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/custom_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key});

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
