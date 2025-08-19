import 'package:dio/dio.dart';
import 'package:egyptian_supermaekat/core/api/dio_consumer.dart';
import 'package:egyptian_supermaekat/core/app_router.dart';
import 'package:egyptian_supermaekat/core/utils/cache_helper.dart';
import 'package:egyptian_supermaekat/features/auth/data/repo/auth_repo_implement.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) =>
              AuthCubit(AuthRepoImplement(DioConsumer(dio: Dio()))),
        ),
           
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
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
