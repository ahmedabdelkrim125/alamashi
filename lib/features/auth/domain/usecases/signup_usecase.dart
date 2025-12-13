import 'package:egyptian_supermaekat/core/utils/validators.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model.dart';
import 'package:egyptian_supermaekat/features/auth/data/repo/auth_repo.dart';

class SignupUseCase {
  final AuthRepo repository;

  SignupUseCase(this.repository);

  Future<UserModel> call(User user, String password) async {
    final emailError = AppValidators.validateEmail(user.email);
    if (emailError != null) {
      throw Exception(emailError);
    }

    final userNameError = AppValidators.validateNotEmpty(user.userName);
    if (userNameError != null) {
      throw Exception("اسم المستخدم مطلوب");
    }

    if (user.userName!.length < 3) {
      throw Exception("اسم المستخدم يجب أن يكون 3 أحرف على الأقل");
    }

    final passwordError = AppValidators.validatePassword(password);
    if (passwordError != null) {
      throw Exception(passwordError);
    }

    final phoneError = AppValidators.validateEgyptianPhoneNumber(user.phone);
    if (phoneError != null) {
      throw Exception(phoneError);
    }

    return await repository.signup(user, password);
  }
}
