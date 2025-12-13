import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/create_new_passwod_widgets.dart/create_new_passwod_header.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/create_new_passwod_widgets.dart/create_new_password_button.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/create_new_passwod_widgets.dart/create_new_password_field.dart';
import 'package:flutter/material.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final logoWidth = isTablet ? 130.0 : 107.0;
        final logoHeight = isTablet ? 120.0 : 100.35;
        final spacing = isTablet ? 100.0 : 79.65;

        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SvgPicture.asset(
                  Assets.imagesLogo,
                  width: logoWidth,
                  height: logoHeight,
                ),
                SizedBox(height: spacing),
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
      },
    );
  }
}
