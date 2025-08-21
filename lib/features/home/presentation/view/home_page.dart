import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الصفحة الرئيسية'),
        actions: [
             
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'تسجيل الخروج',
            onPressed: () {
                 
              context.read<AuthCubit>().logout();
              context.go(AppRouter.kLogin);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('مرحبًا بك!'),
      ),
    );
  }
}