import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/assets.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/custom_form_text_field.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/cutom_button.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/cutom_forget_text.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/social_login_button.dart';
import 'package:flutter/material.dart';
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
              child: FittedBox(
                child: SvgPicture.asset(
                Assets.logo,
                width: 30,
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
              textLable: 'كلمة السر',
              texthit: 'كلمة السر',
            ),
            CutomBuutton(
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
                      backgroundColor: Colors.red,
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
            SocialLoginButton(
              routerPage: '/',
              createAccountText: 'تسجيل',
              noAccountText: 'لديك حساب ب الفعل؟',
            )
          ],
        ),
      ),
    );
  }
}
