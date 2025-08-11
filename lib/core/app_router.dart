import 'package:egyptian_supermaekat/features/auth/presentation/view/login_page.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static String signUp = '/sign_up'; //sign_up page
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: signUp,
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpPage();
            },
          ),
        ],
      ),
    ],
  );
}
