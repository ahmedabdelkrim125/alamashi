import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:egyptian_supermaekat/core/api/api_service.dart';
import 'package:egyptian_supermaekat/core/api/end_points.dart';
import 'package:egyptian_supermaekat/core/errors/error_model.dart';
import 'package:egyptian_supermaekat/core/errors/exceptions.dart';
import 'package:egyptian_supermaekat/core/utils/cache_helper.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/login_request.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/register_request.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model.dart';
import 'package:egyptian_supermaekat/features/auth/data/repo/auth_repo.dart';

class AuthRepoImplement implements AuthRepo {
  final ApiService apiService;
  AuthRepoImplement(this.apiService);

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final request = LoginRequest(email: email, password: password);
      final apiResponse = await apiService.login(request);

      // ✅ تحويل ApiResponse<LoginResponseDto> → UserModel
      if (apiResponse.status == 'success' && apiResponse.data != null) {
        return UserModel(
          status: apiResponse.status,
          loginResponseDto: apiResponse.data,
        );
      } else {
        throw ServerException(
          errorModel: ErrorModel(
            status: 400,
            errorMessage: apiResponse.message ?? "فشل تسجيل الدخول",
          ),
        );
      }
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  @override
  Future<UserModel> signup(User user, String password) async {
    try {
      final request = RegisterRequest(
        userName: user.userName ?? '',
        email: user.email ?? '',
        password: password,
        phone: user.phone ?? '',
      );
      final apiResponse = await apiService.register(request);

      // ✅ تحويل ApiResponse<LoginResponseDto> → UserModel
      if (apiResponse.status == 'success' && apiResponse.data != null) {
        return UserModel(
          status: apiResponse.status,
          loginResponseDto: apiResponse.data,
        );
      } else {
        throw ServerException(
          errorModel: ErrorModel(
            status: 400,
            errorMessage: apiResponse.message ?? "فشل التسجيل",
          ),
        );
      }
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  @override
  Future<UserModel> refreshToken() async {
    final accessToken = CacheHelper.getAccessToken();
    final refreshToken = CacheHelper.getRefreshToken();

    try {
      final apiResponse = await apiService.refreshToken({
        ApiKeys.accessToken: accessToken,
        ApiKeys.refreshToken: refreshToken,
      });

      // ✅ تحويل ApiResponse<LoginResponseDto> → UserModel
      if (apiResponse.status == 'success' && apiResponse.data != null) {
        return UserModel(
          status: apiResponse.status,
          loginResponseDto: apiResponse.data,
        );
      } else {
        throw ServerException(
          errorModel: ErrorModel(
            status: 401,
            errorMessage: apiResponse.message ?? "فشل تحديث الـ Token",
          ),
        );
      }
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  ServerException _handleDioException(DioException e) {
    final statusCode = e.response?.statusCode ?? 500;
    final data = e.response?.data;

    // اتعامل مع Redirect (3xx)
    if (statusCode >= 300 && statusCode < 400) {
      return ServerException(
        errorModel: ErrorModel(
          status: statusCode,
          errorMessage: "خطأ في الاتصال. تأكد من رابط السيرفر.",
        ),
      );
    }

    // اتعامل مع الأخطاء (4xx, 5xx)
    if (data != null && statusCode >= 400) {
      if (data is Map<String, dynamic>) {
        return ServerException(errorModel: ErrorModel.fromJson(data));
      } else if (data is String) {
        try {
          final decoded = jsonDecode(data) as Map<String, dynamic>;
          return ServerException(errorModel: ErrorModel.fromJson(decoded));
        } catch (_) {
          return ServerException(
            errorModel: ErrorModel(status: statusCode, errorMessage: data),
          );
        }
      }
    }

    // Default error
    return ServerException(
      errorModel: ErrorModel(
        status: statusCode,
        errorMessage: e.message ?? "حصل مشكلة في الاتصال بالخادم، جرب تاني.",
      ),
    );
  }
}
