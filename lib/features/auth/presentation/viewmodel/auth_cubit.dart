import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:egyptian_supermaekat/core/errors/exceptions.dart';
import 'package:egyptian_supermaekat/core/utils/cache_helper.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model/user.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model/user_model.dart';
import 'package:egyptian_supermaekat/features/auth/data/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  //Login
  AuthCubit(this.authRepo) : super(AuthInitial());

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
        }
      } else {
        emit(AuthFailure("Login failed: Missing token in response."));
        return;
      }
      emit(AuthSuccess(userModel));
    } on ServerException catch (e) {
      emit(AuthFailure(e.errorModel.errorMessage));
    }
  }
//SuginUp

  Future<void> signup(User user, String password) async {
    try {
      emit(AuthLoading());
      final userModel = await authRepo.signup(user, password);
      emit(AuthSuccess(userModel));
    } on ServerException catch (e) {
      emit(AuthFailure(e.errorModel.errorMessage));
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
}
