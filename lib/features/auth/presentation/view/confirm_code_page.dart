import 'package:egyptian_supermaekat/features/auth/presentation/view/Widgets/confirm_code_widgets/confirm_code_page_body.dart';
import 'package:flutter/material.dart';

class ConfirmCodePage extends StatelessWidget {
  const ConfirmCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConfirmCodePageBody(),
      ),
    );
  }
}
