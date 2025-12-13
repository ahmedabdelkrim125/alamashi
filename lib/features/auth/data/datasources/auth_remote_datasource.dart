import 'package:egyptian_supermaekat/core/api/api_service.dart';
import 'package:egyptian_supermaekat/core/models/api_response.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/login_request.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/login_response_dto.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/register_request.dart';


// send Request =< Response 

//** Interface**//
abstract class AuthRemoteDataSource {
  //Login
  Future<ApiResponse<LoginResponseDto>> login(LoginRequest request);
  //Register
  Future<ApiResponse<LoginResponseDto>> register(RegisterRequest request);
  //RefreshToken
  Future<ApiResponse<LoginResponseDto>> refreshToken(
    Map<String, dynamic> tokens,
  );
}

//**Implementation => AuthRemoteDataSource**//

 class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);
  @override
  Future<ApiResponse<LoginResponseDto>> login(LoginRequest request) async {
    return await apiService.login(request);
  }

  @override
  Future<ApiResponse<LoginResponseDto>> register(
    RegisterRequest request,
  ) async {
    return await apiService.register(request);
  }

  @override
  Future<ApiResponse<LoginResponseDto>> refreshToken(
    Map<String, dynamic> tokens,
  ) async {
    return await apiService.refreshToken(tokens);
  }
}
