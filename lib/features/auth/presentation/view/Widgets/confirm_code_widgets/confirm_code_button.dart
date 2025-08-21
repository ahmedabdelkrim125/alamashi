// lib/features/auth/presentation/view/Widgets/confirm_code_widgets/confirm_code_button.dart

import 'dart:developer';
import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/show_snackbar.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/Custom_Widgets/cutom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmCodeButton extends StatelessWidget {
  const ConfirmCodeButton({
    super.key,
    required this.formKey,
    required this.pinController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController pinController;

  @override
  Widget build(BuildContext context) {
    return CutomButton(
      
      textButton: 'تأكيد',
      onTap: () async {
        if (!context.mounted) return;

        if (formKey.currentState!.validate()) {
          log('جاري التحقق من الكود: ${pinController.text}');

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const AlertDialog(
              backgroundColor: ThemeColor.bgColor,
              content: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 16),
                  Text("...جاري التحقق من الكود"),
                ],
              ),
            ),
          );

          await Future.delayed(const Duration(seconds: 2));

          if (context.mounted) {
            Navigator.of(context).pop(); 
          }

          if (context.mounted) {
            showCustomSnackBar(
              context: context,
              message: 'تم تأكيد الكود بنجاح',
              isError: false,
            );
          }

          await Future.delayed(const Duration(seconds: 1));

          if (context.mounted) {
          
            context.go(AppRouter.kCreateNewPasswod);
          }
        }
      },
    );
  }
}
