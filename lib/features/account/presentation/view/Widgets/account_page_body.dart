import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/features/account/presentation/view/Widgets/custom_app_bar_account.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AccountPageBody extends StatelessWidget {
  const AccountPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomAppBarAccount(),
        ImageProfile(),
        IconButton(
            onPressed: () {
              context.read<AuthCubit>().logout();
              context.go(AppRouter.kLogin);
            },
            icon: Icon(Icons.logout))
      ],
    );
  }
}

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
