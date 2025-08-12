import 'package:egyptian_supermaekat/features/auth/presentation/view/login_page.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/sign_up_page.dart';
import 'package:egyptian_supermaekat/features/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:egyptian_supermaekat/features/splash/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static String signUp = '/sign_up'; //sign_up page
  static String onboarding = '/on_boarding'; //on_boarding page
  static String login = '/login'; //loginScreen page
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: signUp,
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpPage();
            },
          ),
          GoRoute(
            path: login,
            builder: (BuildContext context, GoRouterState state) {
              return const LoginPage();
            },
          ),
           GoRoute(
            path: onboarding,
            builder: (BuildContext context, GoRouterState state) {
              return const OnBoardingScreen();
            },
          ),
        ],
      ),
    ],
  );
}
