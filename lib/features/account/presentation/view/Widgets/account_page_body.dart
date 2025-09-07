import 'package:egyptian_supermaekat/features/account/presentation/view/Widgets/custom_app_bar_account.dart';
import 'package:flutter/material.dart';

class AccountPageBody extends StatelessWidget {
  const AccountPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomAppBarAccount(),
        ImageProfile()
      ],
    );
  }
}

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
