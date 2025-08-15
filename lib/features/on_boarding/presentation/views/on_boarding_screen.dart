import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/features/on_boarding/presentation/views/Widgets/on_boarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: OnBoardinScreenClipper(),
            child: Container(
              height: size.height * 0.7,
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: OnBoardingBody(),
          ),
        ],
      ),
    );
  }
}

class OnBoardinScreenClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * .85);
    var controlPoint = Offset(size.width * 0.45, size.height * 0.95);
    var endPoint = Offset(size.width, size.height * 0.7);
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    // 3. يكمل الخط لأعلى اليمين
    path.lineTo(size.width, 0);

    // 4. يقفل الشكل بالكامل
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
