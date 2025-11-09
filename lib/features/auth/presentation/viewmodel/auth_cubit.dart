import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:egyptian_supermaekat/core/api/end_points.dart';
import 'package:egyptian_supermaekat/core/errors/exceptions.dart';
import 'package:egyptian_supermaekat/core/utils/cache_helper.dart';
import 'package:egyptian_supermaekat/core/utils/debug_tokens.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/login_response_dto.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model.dart';
import 'package:egyptian_supermaekat/features/auth/data/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  String _mapExceptionToMessage(ServerException e) {
    final statusCode = e.errorModel.status;
    final errorMessage = e.errorModel.errorMessage ?? '';
    
    log("DEBUGGING: Status code from HTTP response ==> ${e.statusCode}");
    log("DEBUGGING: Status code from response body ==> $statusCode");
    log("DEBUGGING: Server error message ==> $errorMessage");

    if (errorMessage.isNotEmpty) {
      if (errorMessage.toLowerCase().contains("phone") && 
          errorMessage.toLowerCase().contains("already")) {
        final phoneMatch = RegExp(r"'(\d+)'").firstMatch(errorMessage);
        final phone = phoneMatch?.group(1) ?? '';
        return "رقم الهاتف ${phone.isNotEmpty ? phone : 'هذا'} مسجل بالفعل.";
      }
      
      if (errorMessage.toLowerCase().contains("email") && 
          errorMessage.toLowerCase().contains("already")) {
        return "البريد الإلكتروني مسجل بالفعل.";
      }
      
      if (errorMessage.toLowerCase().contains("username") && 
          errorMessage.toLowerCase().contains("already")) {
        return "اسم المستخدم مسجل بالفعل.";
      }

      if (errorMessage.toLowerCase().contains("invalid") && 
          errorMessage.toLowerCase().contains("password")) {
        return "كلمة المرور غير صحيحة.";
      }

      if (errorMessage.toLowerCase().contains("not found") || 
          errorMessage.toLowerCase().contains("invalid credentials")) {
        return "البريد الإلكتروني أو كلمة المرور غير صحيحة.";
      }
    }

    switch (statusCode) {
      case 400:
        return errorMessage.isNotEmpty 
          ? errorMessage 
          : "البيانات المدخلة غير صحيحة.";
      
      case 401:
        return "البريد الإلكتروني أو كلمة المرور غير صحيحة.";
      
      case 403:
        return "ليس لديك الصلاحية للقيام بهذا الإجراء.";
      
      case 404:
        return "الرابط المطلوب غير موجود على الخادم.";
      
      case 409:
        return "البيانات مسجلة بالفعل. جرب بيانات مختلفة.";
      
      case 500:
        return "حدث خطأ في الخادم، يرجى المحاولة مرة أخرى في وقت لاحق.";
      
      case 503:
        return "الخدمة غير متاحة حاليًا أو لا يوجد اتصال بالإنترنت.";
      
      default:
        return errorMessage.isNotEmpty 
          ? errorMessage 
          : "حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.";
    }
  }

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      final userModel = await authRepo.login(email, password);

      if (userModel.status == 'success' && userModel.accessToken != null) {
        await CacheHelper.saveAccessToken(userModel.accessToken!);
        log("✅ Access Token Saved!");
        if (userModel.refreshToken != null) {
          await CacheHelper.saveRefreshToken(userModel.refreshToken!);
          log("✅ Refresh Token Saved!");
          await debugTokens();
        }
      } else {
        emit(AuthFailure("Login failed: Missing token in response."));
        return;
      }
      Map<String, dynamic> decodedToken = JwtDecoder.decode(
        userModel.accessToken!,
      );

      String? userRole = decodedToken[ApiKeys.jwtRole];
      String? userId = decodedToken[ApiKeys.jwtNameIdentifier];
      String? userName = decodedToken[ApiKeys.jwtName];
      log("--- Decoded Token Info ---");
      log("User Role: $userRole");
      log("User ID from Token: $userId");
      log("Username from Token: $userName");
      log("--------------------------");
      DateTime expiryDate = JwtDecoder.getExpirationDate(
        userModel.accessToken!,
      );
      log("Token will expire on: $expiryDate");

      emit(AuthSuccess(userModel));
    } on ServerException catch (e) {
      final friendlyMessage = _mapExceptionToMessage(e);
      emit(AuthFailure(friendlyMessage));
    } catch (e) {
      log("Unexpected error during login: $e");
      emit(AuthFailure("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }

  Future<void> signup(User user, String password) async {
    try {
      emit(AuthLoading());
      final userModel = await authRepo.signup(user, password);
      emit(AuthSuccess(userModel));
      await debugTokens();
    } on ServerException catch (e) {
      final friendlyMessage = _mapExceptionToMessage(e);
      emit(AuthFailure(friendlyMessage));
    } catch (e) {
      log("Unexpected error during signup: $e");
      emit(AuthFailure("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }

  Future<void> logout() async {
    await CacheHelper.removeAccessToken();
    await CacheHelper.removeRefreshToken();
    emit(AuthInitial());
    log('❌ All tokens removed. User logged out.');
  }

  Future<void> checkAuthStatus() async {
    await Future.delayed(Duration.zero);
    final accessToken = CacheHelper.getAccessToken();
    log(
      "DEBUG: Checking auth status. Access token: ${accessToken != null ? 'present' : 'null'}",
    );

    if (accessToken != null && accessToken.isNotEmpty) {
      if (JwtDecoder.isExpired(accessToken)) {
        log("Access Token has expired. Attempting to refresh...");
        try {
          final newUserModel = await authRepo.refreshToken();
          await CacheHelper.saveAccessToken(newUserModel.accessToken!);
          if (newUserModel.refreshToken != null) {
            await CacheHelper.saveRefreshToken(newUserModel.refreshToken!);
          }
          log("✅ Token refreshed successfully!");
          await debugTokens();
          emit(AuthSuccess(newUserModel));
        } catch (e) {
          log("❌ Failed to refresh token. Logging out. Error: $e");
          await logout();
        }
      } else {
        log("✅ Found valid token. User is already logged in.");
        Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
        final user = User(
          userId: int.parse(decodedToken[ApiKeys.jwtNameIdentifier] ?? '0'),
          userName: decodedToken[ApiKeys.jwtName],
          email: decodedToken[ApiKeys.jwtEmail],
        );
        final userModel = UserModel(
          status: 'success',
          loginResponseDto: LoginResponseDto(
            accessToken: accessToken,
            user: user,
          ),
        );

        emit(AuthSuccess(userModel));
      }
    } else {
      log("No token found. User needs to log in.");
      emit(AuthInitial());
    }
  }
}