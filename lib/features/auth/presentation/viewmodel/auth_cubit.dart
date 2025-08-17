import 'package:bloc/bloc.dart';
import 'package:egyptian_supermaekat/core/errors/exceptions.dart';
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
      emit(AuthSuccess(userModel));
    } on ServerException catch (e) {
      emit(AuthFailure(e.errorModel.errorMessage));
    } catch (e) {
      emit(AuthFailure("حدث خطأ غير متوقع: ${e.toString()}"));
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
}
