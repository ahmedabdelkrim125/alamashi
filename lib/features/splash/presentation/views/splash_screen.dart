import 'package:flutter/material.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/features/splash/presentation/views/Widgets/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ThemeColor.bgColor,
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
          const Center(
            child: SplashScreenBody(),
          ),
        ],
      ),
    );
  }
}

class SplashScreenClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double w = size.width;
    double h = size.height;
    path.lineTo(0, h * .75);

    var controlPoint = Offset(size.width * 0.5, size.height * .8);

    var endPoint = Offset(size.width, size.height * .7);

    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
