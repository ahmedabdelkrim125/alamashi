// Path: lib/features/auth/presentation/cubit/auth_cubit.dart

import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:egyptian_supermaekat/core/errors/exceptions.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model.dart';
import 'package:egyptian_supermaekat/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:egyptian_supermaekat/features/auth/domain/usecases/login_usecase.dart';
import 'package:egyptian_supermaekat/features/auth/domain/usecases/logout_usecase.dart';
import 'package:egyptian_supermaekat/features/auth/domain/usecases/signup_usecase.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/utils/error_message_mapper.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/utils/token_validator.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final LogoutUseCase logoutUseCase;
  final CheckAuthStatusUseCase checkAuthStatusUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.signupUseCase,
    required this.logoutUseCase,
    required this.checkAuthStatusUseCase,
  }) : super(AuthInitial());

  /// تسجيل الدخول
  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      
      // استدعاء UseCase
      final userModel = await loginUseCase(email, password);

      // Log token info للـ debugging
      if (userModel.accessToken != null) {
        TokenValidator.logTokenExpiry(userModel.accessToken!);
        TokenValidator.extractUserFromToken(userModel.accessToken!);
      }

      emit(AuthSuccess(userModel));
    } on ServerException catch (e) {
      // تحويل الـ exception لرسالة مفهومة
      final friendlyMessage = ErrorMessageMapper.mapServerExceptionToMessage(e);
      emit(AuthFailure(friendlyMessage));
    } catch (e) {
      // أي خطأ آخر (مثل validation errors من UseCase)
      log("❌ Unexpected error during login: $e");
      emit(AuthFailure(e.toString()));
    }
  }

  /// التسجيل (إنشاء حساب جديد)
  Future<void> signup(User user, String password) async {
    try {
      emit(AuthLoading());
      
      // استدعاء UseCase
      final userModel = await signupUseCase(user, password);

      emit(AuthSuccess(userModel));
    } on ServerException catch (e) {
      // تحويل الـ exception لرسالة مفهومة
      final friendlyMessage = ErrorMessageMapper.mapServerExceptionToMessage(e);
      emit(AuthFailure(friendlyMessage));
    } catch (e) {
      // أي خطأ آخر (مثل validation errors من UseCase)
      log("❌ Unexpected error during signup: $e");
      emit(AuthFailure(e.toString()));
    }
  }

  /// تسجيل الخروج
  Future<void> logout() async {
    try {
      // استدعاء UseCase
      await logoutUseCase();
      
      emit(AuthInitial());
    } catch (e) {
      log("❌ Error during logout: $e");
      
      // حتى لو حصل خطأ، نعود للـ Initial State
      emit(AuthInitial());
    }
  }

  /// التحقق من حالة الـ Authentication
  /// 
  /// يتم استدعاؤها عند فتح التطبيق للتحقق من وجود session سابق
  Future<void> checkAuthStatus() async {
    // تأخير بسيط للتأكد من تهيئة الـ dependencies
    await Future.delayed(Duration.zero);
    
    try {
      // استدعاء UseCase
      final userModel = await checkAuthStatusUseCase();
      
      if (userModel != null) {
        // المستخدم مسجل دخول
        emit(AuthSuccess(userModel));
      } else {
        // لا يوجد session سابق
        emit(AuthInitial());
      }
    } catch (e) {
      log("❌ Error checking auth status: $e");
      
      // في حالة حدوث خطأ، نفترض أن المستخدم غير مسجل
      emit(AuthInitial());
    }
  }
}