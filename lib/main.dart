import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    
    ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) {
        return const EgyptianSupermaekat();
      },
    ),
  );
}

class EgyptianSupermaekat extends StatelessWidget {
  const EgyptianSupermaekat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      builder: (context, child) {
        return child!;
      },
    );
  }
}
