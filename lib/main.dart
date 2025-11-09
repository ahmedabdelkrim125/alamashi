import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/di/injection.dart';
import 'package:egyptian_supermaekat/core/utils/cache_helper.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:egyptian_supermaekat/features/main/presentation/viewmodel/navigation_cubit.dart';
import 'package:egyptian_supermaekat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   await setupInjection();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
         
           create: (context) => getIt<AuthCubit>()..checkAuthStatus(),
        ),
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return const EgyptianSupermaekat();
        },
      ),
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
