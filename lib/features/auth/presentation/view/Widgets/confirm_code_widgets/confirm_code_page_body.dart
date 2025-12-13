import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/confirm_code_widgets/confirm_code_button.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/confirm_code_widgets/confirm_code_fields.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/confirm_code_widgets/confirm_code_header.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/confirm_code_widgets/resend_code_button.dart';
import 'package:flutter/material.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = ResponsiveHelper.isTablet(context);
        final logoWidth = isTablet ? 130.0 : 107.0;
        final logoHeight = isTablet ? 120.0 : 100.35;
        final firstSpacing = isTablet ? 100.0 : 79.65;
        final secondSpacing = isTablet ? 20.0 : 16.0;
        final thirdSpacing = isTablet ? 120.0 : 100.0;

        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SvgPicture.asset(
                  Assets.imagesLogo,
                  width: logoWidth,
                  height: logoHeight,
                ),
                SizedBox(height: firstSpacing),
                ConfirmCodeHeader(),
                ConfirmCodeFields(
                  focusNode: focusNode,
                  pinController: pinController,
                ),
                SizedBox(height: secondSpacing),
                ResendCodeButton(onPressed: () {}),
                SizedBox(height: thirdSpacing),
                ConfirmCodeButton(
                  //محتاجين يتغيرو
                  formKey: formKey,
                  pinController: TextEditingController(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//
