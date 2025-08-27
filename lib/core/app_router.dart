import 'package:egyptian_supermaekat/features/auth/presentation/view/confirm_code_page.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/create_new_passwod_page.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/forgot_password_page.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/login_page.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/view/sign_up_page.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/dairy_page.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/fruits_page.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/grocery_page.dart';
import 'package:egyptian_supermaekat/features/home/presentation/view/pages/pharmacy_page.dart';
import 'package:egyptian_supermaekat/features/main/presentation/view/main_navigation_page.dart';
import 'package:egyptian_supermaekat/features/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:egyptian_supermaekat/features/splash/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  // تعريف المسارات كثوابت لسهولة الاستخدام وتجنب الأخطاء
  static const kSplash = '/';
  static const kMain = '/main';
  static const kOnBoarding = '/on_boarding';
  static const kLogin = '/login';
  static const kSignUp = '/sign_up';

  static const kForgotPassword = '/forgot-password';
  static const kConfirmCode = '/onfirm-code';
  static const kCreateNewPasswod = '/CreateNewPasswodPage';
  static const kDairyPage = '/DairyPage';
  static const kFruitsPage = '/FruitsPage';
  static const kGroceryPage = '/GroceryPage';
  static const kPharmacyPage = '/PharmacyPage';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kSplash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: kOnBoarding,
        builder: (BuildContext context, GoRouterState state) {
          return const OnBoardingScreen();
        },
      ),
      GoRoute(
        path: kLogin,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: kSignUp,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpPage();
        },
      ),
      GoRoute(
        path: kForgotPassword,
        builder: (BuildContext context, GoRouterState state) {
          return LoginForgetPasswordPage();
        },
      ),
      GoRoute(
        path: kConfirmCode,
        builder: (BuildContext context, GoRouterState state) {
          return ConfirmCodePage();
        },
      ),
      GoRoute(
        path: kCreateNewPasswod,
        builder: (BuildContext context, GoRouterState state) {
          return CreateNewPasswodPage();
        },
      ),
      GoRoute(
        path: kMain,
        builder: (BuildContext context, GoRouterState state) {
          return MainNavigationPage();
        },
      ),
      GoRoute(
        path: kDairyPage,
        builder: (BuildContext context, GoRouterState state) {
          return DairyPage();
        },
      ),
      GoRoute(
        path: kFruitsPage,
        builder: (BuildContext context, GoRouterState state) {
          return FruitsPage();
        },
      ),
      GoRoute(
        path: kGroceryPage,
        builder: (BuildContext context, GoRouterState state) {
          return GroceryPage();
        },
      ),
      GoRoute(
        path: kPharmacyPage,
        builder: (BuildContext context, GoRouterState state) {
          return PharmacyPage();
        },
      ),
    ],
  );
}
