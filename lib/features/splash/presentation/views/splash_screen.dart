import 'package:egyptian_supermaekat/features/splash/presentation/views/Widgets/splash_screen_clipper.dart';
import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/features/splash/presentation/views/Widgets/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          ClipPath(
            clipper: SplashScreenClipper(),
            child: Container(
              
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ThemeColor.primaryGreenColor,
                    ThemeColor.orangeAccentColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          SplashScreenBody(),
        ],
      ),
    );
  }
}
