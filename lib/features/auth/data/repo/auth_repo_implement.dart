import 'package:egyptian_supermaekat/core/api/api_consumer.dart';
import 'package:egyptian_supermaekat/core/api/end_points.dart';
import 'package:egyptian_supermaekat/core/errors/error_model.dart';
import 'package:egyptian_supermaekat/core/errors/exceptions.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model/user.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model/user_model.dart';
import 'package:egyptian_supermaekat/features/auth/data/repo/auth_repo.dart';
import 'package:dio/dio.dart';

class AuthRepoImplement implements AuthRepo {
  final ApiConsumer api;

  AuthRepoImplement(this.api);

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await api.post(
        EndPoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response == null) {
        throw ServerException(
          errorModel: ErrorModel(
            status: 500,
            errorMessage: "الخادم رجع رد فاضي، جرب تاني بعد شوية.",
          ),
        );
      }

      return UserModel.fromJson(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  @override
  Future<UserModel> signup(User user, String password) async {
    try {
      final response = await api.post(
        EndPoints.createNewUser,
        data: {
          ApiKeys.userName: user.userName,
          ApiKeys.email: user.email,
          ApiKeys.password: password,
          ApiKeys.phone: user.phone,
        },
      );

      if (response == null) {
        throw ServerException(
          errorModel: ErrorModel(
            status: 500,
            errorMessage: "الخادم رجع رد فاضي، جرب تاني بعد شوية.",
          ),
        );
      }

      return UserModel.fromJson(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  ServerException _handleDioException(DioException e) {
    if (e.response?.data != null) {
      return ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    }

    return ServerException(
      errorModel: ErrorModel(
        status: 500,
        errorMessage: "حصل مشكلة في الاتصال بالخادم، جرب تاني.",
      ),
    );
  }
}
