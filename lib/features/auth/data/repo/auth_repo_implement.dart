import 'package:egyptian_supermaekat/core/api/api_consumer.dart';
import 'package:egyptian_supermaekat/core/api/end_points.dart';
import 'package:egyptian_supermaekat/core/errors/error_model.dart';
import 'package:egyptian_supermaekat/core/errors/exceptions.dart';
import 'package:egyptian_supermaekat/core/utils/cache_helper.dart';
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

  @override
  Future<UserModel> refreshToken() async {
    final accessToken = CacheHelper.getAccessToken();
    final refreshToken = CacheHelper.getRefreshToken();

    try {
      final response = await api.post(
        EndPoints.refresh,
        data: {
          ApiKeys.accessToken: accessToken,
          ApiKeys.refreshToken: refreshToken
        },
      );
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
//   @override
// Future<UserModel> signInWithGoogle() async {
//   try {
//     final g = GoogleSignIn.instance;
//     await g.initialize();

//     final GoogleSignInAccount? googleUser = await g.authenticate();
//     if (googleUser == null) throw Exception("تم إلغاء تسجيل الدخول");

//     final googleAuth = googleUser.authentication;

//     // مفيش accessToken في v7+
//     final credential = fb.GoogleAuthProvider.credential(
//       idToken: googleAuth.idToken,
//     );

//     final userCred =
//         await fb.FirebaseAuth.instance.signInWithCredential(credential);

//     final user = userCred.user;
//     if (user == null) throw Exception("Firebase رجّع user = null");

//     return UserModel(
//       status: "success",
//       accessToken: await user.getIdToken(), // ده هو التوكن اللي تسجّله عندك
//       user: app.User(
//         userId: user.uid.hashCode,
//         userName: user.displayName ?? "",
//         email: user.email ?? "",
//       ),
//     );
//   } catch (e) {
//     throw Exception("Google Sign-In Failed: $e");
//   }
// }




  
 
}
