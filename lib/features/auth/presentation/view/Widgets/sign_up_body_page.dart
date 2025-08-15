import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/custom_form_text_field.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/cutom_button.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/cutom_forget_text.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/social_login_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpBodyPage extends StatelessWidget {
  SignUpBodyPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(80),
              child: SvgPicture.asset(
                width: 107.sp,
                height: 100.35.sp,
                Assets.imagesLogo,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'مرحباً بك',
                textAlign: TextAlign.end,
                style: Style.textStyle18.copyWith(
                  fontWeight: FontWeight.w700,
                  fontFamily: cairoBold,
                  color: ThemeColor.darkGreenColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                'من فضلك قم بإدخال بياناتك لكي تتمكن من إنشاء حساب',
                textAlign: TextAlign.end,
                style: Style.textStyle12.copyWith(
                  fontWeight: FontWeight.w700,
                  fontFamily: cairoBold,
                  color: ThemeColor.neutralGrayColor,
                ),
              ),
            ),
            CustomFormTextField(
              textLable: 'الاسم',
              texthit: 'الاسم',
            ),
            CustomFormTextField(
              textLable: 'البريد الالكتروني',
              texthit: 'البريد الالكتروني',
            ),
            CustomFormTextField(
              prefix: SvgPicture.asset(
                Assets.eyeSlashIcon,
                height: 20.sp,
                width: 20.sp,
              ),
              textLable: 'كلمة السر',
              texthit: 'كلمة السر',
            ),
            CutomButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: ThemeColor.primaryColor,
                      content: Text(
                        'تم انشاء الحساب بنجاح',
                        textAlign: TextAlign.center,
                        style: Style.textStyle20.copyWith(
                          fontFamily: cairoRegular,
                        ),
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: ThemeColor.errorColor,
                      content: Text(
                        'ادخل بيانات الحقل',
                        textAlign: TextAlign.center,
                        style: Style.textStyle20.copyWith(
                          fontFamily: cairoRegular,
                        ),
                      ),
                    ),
                  );
                }
              },
              textButton: 'انشاء حساب',
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: CutomForgetText(
                textline: 'نسيت كلمة المرور؟',
              ),
            ),
            SocialLoginSection(
              routerPage: AppRouter.login,
              createAccountText: 'هل تمتلك حساب بالفعل ؟ ',
              
            )
          ],
        ),
      ),
    );
  }
}
