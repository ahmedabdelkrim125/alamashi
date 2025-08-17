import 'package:egyptian_supermaekat/features/auth/data/model/user_model/user.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model/user_model.dart';

abstract class AuthRepo {
  Future<UserModel> login(String email, String password);
  Future<UserModel> signup(User user, String password);
}
