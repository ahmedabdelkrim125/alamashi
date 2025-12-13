import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _cursorAnimationController;

  @override
  void initState() {
    super.initState();
    _initializeApp();

    _cursorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _cursorAnimationController.repeat(reverse: true);
  }

  Future<void> _initializeApp() async {
    await Future.wait([
      Future.delayed(const Duration(seconds: 5)),
      context.read<AuthCubit>().checkAuthStatus(),
    ]);

    if (mounted) {
      final state = context.read<AuthCubit>().state;
      if (state is AuthSuccess) {
        context.go(AppRouter.kMain);
      } else {
        context.go(AppRouter.kOnBoarding);
      }
    }
  }

  @override
  void dispose() {
    _cursorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery for layout responsiveness
    final isTablet = ResponsiveHelper.isTablet(context);
    // final padding = ResponsiveHelper.getPadding(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(Assets.splashFullDesign, fit: BoxFit.cover),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'عـالـمـاشـي',
                      textStyle: Style.textStyle10.copyWith(
                        color: ThemeColor.bgColor,
                        fontFamily: aldhabiRegular,
                        fontSize: isTablet
                            ? 80.sp
                            : 69.39.sp, // Using ScreenUtil for font size
                      ),
                      speed: const Duration(milliseconds: 150),
                      cursor: '',
                    ),
                  ],
                  isRepeatingAnimation: false,
                  totalRepeatCount: 1,
                ),
                FadeTransition(
                  opacity: _cursorAnimationController,
                  child: Text(
                    '|',
                    style: Style.textStyle10.copyWith(
                      color: ThemeColor.bgColor,
                      fontFamily: aldhabiRegular,
                      fontSize: isTablet
                          ? 70.sp
                          : 60.sp, // Using ScreenUtil for font size
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
