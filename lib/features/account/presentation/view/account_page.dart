import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حسابي'),
      ),
      body:  Center(
        child:      
          IconButton(
            icon:  Icon(Icons.logout),
            tooltip: 'تسجيل الخروج',
            onPressed: () {
                 
              context.read<AuthCubit>().logout();
              context.go(AppRouter.kLogin);
            },
          )
      ),
    );
  }
}