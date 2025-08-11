import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EgyptianSupermaekat());
}

class EgyptianSupermaekat extends StatelessWidget {
  const EgyptianSupermaekat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
     
    );
  }
}
