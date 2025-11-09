import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/features/splash/presentation/views/Widgets/splash_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future.wait([
      Future.delayed(const Duration(seconds: 3)),
      context.read<AuthCubit>().checkAuthStatus(),
    ]);
    if (mounted) {
      final state = context.read<AuthCubit>().state;
      if (state is AuthSuccess) {
        context.go(AppRouter.kMain);
      } else {
        // Check if onboarding was shown before
        // For now, redirect to login page directly
        context.go(AppRouter.kLogin);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashScreenBody());
  }
}
