import 'dart:developer';
import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/Custom_Widgets/cutom_button.dart';
import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateNewPasswordButton extends StatelessWidget {
  const CreateNewPasswordButton({
    super.key,
    required this.formKey,
    required this.passwordController,
    
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return CutomButton(
 
      textButton: 'حفظ كلمة المرور',
      onTap: () async {
        if (!context.mounted) return;

        if (formKey.currentState!.validate()) {
          log('حفظ كلمة المرور الجديدة...');

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const AlertDialog(
              backgroundColor: ThemeColor.bgColor,
              content: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 16),
                  Text("...جاري حفظ كلمة المرور"),
                ],
              ),
            ),
          );

          await Future.delayed(const Duration(seconds: 2));

          if (context.mounted) {
            Navigator.of(context).pop(); // إغلاق نافذة التحميل
          }

          if (context.mounted) {
            // 3. تم تغيير رسالة النجاح
            showCustomSnackBar(
              context: context,
              message: 'تم تغيير كلمة المرور بنجاح',
              isError: false,
            );
          }

          await Future.delayed(const Duration(seconds: 1));

          if (context.mounted) {
            // 4. تم تغيير وجهة التوجيه إلى صفحة تسجيل الدخول
            context.go(AppRouter.kLogin);
          }
        }
      },
    );
  }
}