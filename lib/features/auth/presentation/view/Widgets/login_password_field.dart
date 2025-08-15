import 'package:flutter/material.dart';
import '../../../../../core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_form_text_field.dart';

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
