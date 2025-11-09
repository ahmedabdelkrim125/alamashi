import 'package:dio/dio.dart';
import 'package:egyptian_supermaekat/core/models/api_response.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/login_request.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/login_response_dto.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/register_request.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_response.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/users_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:egyptian_supermaekat/core/api/end_points.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(EndPoints.login)
  Future<ApiResponse<LoginResponseDto>> login(@Body() LoginRequest request);

  @POST(EndPoints.register)
  Future<ApiResponse<LoginResponseDto>> register(@Body() RegisterRequest request);

  @POST(EndPoints.refresh)
  Future<ApiResponse<LoginResponseDto>> refreshToken(@Body() Map<String, dynamic> tokens);

  @GET(EndPoints.getAllUsers)
  Future<UsersResponse> getAllUsers();

  @GET('/api/Users/{id}')
  Future<UserResponse> getUserById(@Path('id') int id);
}