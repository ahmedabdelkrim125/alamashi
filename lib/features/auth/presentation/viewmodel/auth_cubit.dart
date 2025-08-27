import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:egyptian_supermaekat/core/errors/exceptions.dart';
import 'package:egyptian_supermaekat/core/utils/cache_helper.dart';
import 'package:egyptian_supermaekat/core/utils/debug_tokens.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model/user.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model/user_model.dart';
import 'package:egyptian_supermaekat/features/auth/data/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  //Login
  AuthCubit(this.authRepo) : super(AuthInitial());
  String _mapExceptionToMessage(ServerException e) {
    final statusCode = e.errorModel.status;
    final errorMessage = e.errorModel.errorMessage.toLowerCase();
    log("DEBUGGING: The status code received is ==> ${e.statusCode}");
    if (statusCode == 401 || statusCode == 400) {
      //    هذه الأكواد لمشاكل في تسجيل الدخول
      return "البريد الإلكتروني أو كلمة المرور غير صحيحة. يرجى المحاولة مرة أخرى.";
    }
    if (statusCode == 409) {
      // 409 Conflict
      return "هذا البريد الإلكتروني مسجل بالفعل. يرجى تسجيل الدخول بدلاً من ذلك.";
    }

    if (errorMessage.contains("email not found")) {
      return "هذا البريد الإلكتروني غير مسجل لدينا.";
    }
    return "حدث خطأ ما. يرجى المحاولة مرة أخرى لاحقًا.";
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
          // 🧪 Debug
          await debugTokens();
        }
      } else {
        emit(AuthFailure("Login failed: Missing token in response."));
        return;
      }
      Map<String, dynamic> decodedToken =
          JwtDecoder.decode(userModel.accessToken!);
      String? userRole = decodedToken['role'];
      String? userId = decodedToken['nameid'];
      String? userName = decodedToken['unique_name'];
      log("--- Decoded Token Info ---");
      log("User Role: $userRole");
      log("User ID from Token: $userId");
      log("Username from Token: $userName");
      log("--------------------------");
      DateTime expiryDate =
          JwtDecoder.getExpirationDate(userModel.accessToken!);
      log("Token will expire on: $expiryDate");

      emit(AuthSuccess(userModel));
    } on ServerException catch (e) {
      final friendlyMessage = _mapExceptionToMessage(e);
      emit(AuthFailure(friendlyMessage));
    }
  }
//SuginUp

  Future<void> signup(User user, String password) async {
    try {
      emit(AuthLoading());
      final userModel = await authRepo.signup(user, password);
      emit(AuthSuccess(userModel));
      // 🧪 Debug
      await debugTokens();
    } on ServerException catch (e) {
      final friendlyMessage = _mapExceptionToMessage(e);
      emit(AuthFailure(friendlyMessage));
    } catch (e) {
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
          // 🧪 Debug
          await debugTokens();
          emit(AuthSuccess(newUserModel));
        } catch (e) {
          log("❌ Failed to refresh token. Logging out.");
          await logout();
        }
      } else {
        log("✅ Found valid token. User is already logged in.");
        Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
        final user = User(
          userId: int.parse(decodedToken['nameid'] ?? ''),
          userName: decodedToken['unique_name'],
          email: 'loaded_from_token@email.com',
        );
        final userModel =
            UserModel(status: 'success', accessToken: accessToken, user: user);
        emit(AuthSuccess(userModel));
      }
    } else {
      log("No token found. User needs to log in.");
    }
  }
}
