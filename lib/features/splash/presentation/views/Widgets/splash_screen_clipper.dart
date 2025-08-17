import 'package:flutter/material.dart';

class SplashScreenClipper extends CustomClipper<Path> {
  final double startCurveHeightFactor; // بداية المنحنى من اليسار
  final double controlPointXFactor; // عرض نقطة التحكم للمنحنى
  final double controlPointYFactor; // ارتفاع نقطة التحكم للمنحنى
  final double endPointYFactor; //ارتفاع نهاية المنحنى

  SplashScreenClipper({
    this.startCurveHeightFactor = 0.75,
    this.controlPointXFactor = 0.5,
    this.controlPointYFactor = 0.8,
    this.endPointYFactor = 0.7,
  });

  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height * startCurveHeightFactor);

    var controlPoint = Offset(
      size.width * controlPointXFactor,
      size.height * controlPointYFactor,
    );

    var endPoint = Offset(
      size.width,
      size.height * endPointYFactor,
    );

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
