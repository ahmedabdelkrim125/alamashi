import 'package:egyptian_supermaekat/core/utils/validators.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model.dart';
import 'package:egyptian_supermaekat/features/auth/data/repo/auth_repo.dart';

class LoginUseCase {
  final AuthRepo repository;

  LoginUseCase(this.repository);

  Future<UserModel> call(String email, String password) async {
    final emailError = AppValidators.validateEmail(email);
    if (emailError != null) {
      throw Exception(emailError);
    }

    final passwordError = AppValidators.validateNotEmpty(password);
    if (passwordError != null) {
      throw Exception(passwordError);
    }

    return await repository.login(email, password);
  }
}
