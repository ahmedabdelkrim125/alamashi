import 'package:egyptian_supermaekat/core/api/api_consumer.dart';
import 'package:egyptian_supermaekat/core/api/end_points.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model/user.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model/user_model.dart';
import 'package:egyptian_supermaekat/features/auth/data/repo/auth_repo.dart';

class AuthRepoImplement implements AuthRepo {
  final ApiConsumer api;

  AuthRepoImplement(this.api);

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await api.post(
      EndPoints.login,
      data: {
        email: email,
        password: password,
      },
    );
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> signup(User user, String password) async {
    final response = await api.post(
      EndPoints.createNewUser,
      data: {
        "userName": user.userName,
        "email": user.email,
        "phone": user.phone,
        "password": password,
        'permissions': user.permissions,
      },
    );
    return UserModel.fromJson(response);
  }
}
