import 'package:dio/dio.dart';
import 'package:egyptian_supermaekat/core/api/api_consumer.dart';
import 'package:egyptian_supermaekat/core/api/api_interceptors.dart';
import 'package:egyptian_supermaekat/core/api/api_service.dart';
import 'package:egyptian_supermaekat/core/api/dio_consumer.dart';
import 'package:egyptian_supermaekat/core/api/end_points.dart';
import 'package:egyptian_supermaekat/features/auth/data/repo/auth_repo.dart';
import 'package:egyptian_supermaekat/features/auth/data/repo/auth_repo_implement.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/viewmodel/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupInjection() async {
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    // Configuration

    dio.options.baseUrl = EndPoints.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.followRedirects = true;
    dio.options.maxRedirects = 5;

    // Interceptors
    dio.interceptors.add(ApiInterceptors(dio: dio));
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );

    return dio;
  });

  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: getIt<Dio>()),
  );

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // AuthRepo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImplement(getIt<ApiService>()),
  );

  // AuthCubit
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));

  // getIt.registerFactory(() => ,)
}
