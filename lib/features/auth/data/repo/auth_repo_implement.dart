// Path: lib/features/auth/data/repositories/auth_repository_impl.dart

import 'package:dio/dio.dart';
import 'package:egyptian_supermaekat/core/api/end_points.dart';
import 'package:egyptian_supermaekat/core/network/dio_exception_handler.dart';
import 'package:egyptian_supermaekat/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:egyptian_supermaekat/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:egyptian_supermaekat/features/auth/data/mappers/auth_response_mapper.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/login_request.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/register_request.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model.dart';
import 'package:egyptian_supermaekat/features/auth/data/repo/auth_repo.dart';

/// ✅ SRP: ينسق فقط بين Remote و Local DataSources
/// ✅ DIP: يعتمد على abstractions (interfaces) وليس implementations
/// ✅ OCP: مفتوح للتوسع بدون تعديل في الكود الأساسي
/// ✅ LSP: يمكن استبدال أي DataSource بـ implementation آخر
class AuthRepositoryImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      // 1️⃣ إنشاء الـ Request
      final request = LoginRequest(email: email, password: password);
      
      // 2️⃣ استدعاء الـ API
      final apiResponse = await remoteDataSource.login(request);
      
      // 3️⃣ تحويل الـ Response إلى UserModel
      final userModel = AuthResponseMapper.toUserModel(
        apiResponse,
        errorContext: "فشل تسجيل الدخول",
      );

      // 4️⃣ حفظ الـ Tokens محلياً
      if (userModel.accessToken != null) {
        await localDataSource.saveTokens(
          accessToken: userModel.accessToken!,
          refreshToken: userModel.refreshToken,
        );
      }

      return userModel;
    } on DioException catch (e) {
      // معالجة أخطاء Dio
      throw DioExceptionHandler.handle(e);
    }
  }

  @override
  Future<UserModel> signup(User user, String password) async {
    try {
      // 1️⃣ إنشاء الـ Request
      final request = RegisterRequest(
        userName: user.userName ?? '',
        email: user.email ?? '',
        password: password,
        phone: user.phone ?? '',
      );
      
      // 2️⃣ استدعاء الـ API
      final apiResponse = await remoteDataSource.register(request);
      
      // 3️⃣ تحويل الـ Response إلى UserModel
      final userModel = AuthResponseMapper.toUserModel(
        apiResponse,
        errorContext: "فشل التسجيل",
      );

      // 4️⃣ حفظ الـ Tokens محلياً
      if (userModel.accessToken != null) {
        await localDataSource.saveTokens(
          accessToken: userModel.accessToken!,
          refreshToken: userModel.refreshToken,
        );
      }

      return userModel;
    } on DioException catch (e) {
      // معالجة أخطاء Dio
      throw DioExceptionHandler.handle(e);
    }
  }

  @override
  Future<UserModel> refreshToken() async {
    try {
      // 1️⃣ الحصول على الـ Tokens المحفوظة
      final accessToken = localDataSource.getAccessToken();
      final refreshToken = localDataSource.getRefreshToken();

      // 2️⃣ استدعاء الـ API
      final apiResponse = await remoteDataSource.refreshToken({
        ApiKeys.accessToken: accessToken,
        ApiKeys.refreshToken: refreshToken,
      });
      
      // 3️⃣ تحويل الـ Response إلى UserModel
      final userModel = AuthResponseMapper.toUserModel(
        apiResponse,
        errorContext: "فشل تحديث الـ Token",
      );

      // 4️⃣ تحديث الـ Tokens المحفوظة
      if (userModel.accessToken != null) {
        await localDataSource.saveTokens(
          accessToken: userModel.accessToken!,
          refreshToken: userModel.refreshToken,
        );
      }

      return userModel;
    } on DioException catch (e) {
      // معالجة أخطاء Dio
      throw DioExceptionHandler.handle(e);
    }
  }
}