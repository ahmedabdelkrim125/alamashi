import 'package:egyptian_supermaekat/core/errors/error_model.dart';
import 'package:egyptian_supermaekat/core/errors/exceptions.dart';
import 'package:egyptian_supermaekat/core/models/api_response.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/login_response_dto.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model.dart';

//parssing  ApiResponse<LoginResponseDto>  => To UserModel

class AuthResponseMapper {
  static UserModel toUserModel(
    ApiResponse<LoginResponseDto> apiResponse, {
    String errorContext = "فشل العملية",
  }) {
    if (apiResponse.status == 'success' && apiResponse.data != null) {
      return UserModel(
        status: apiResponse.status,
        loginResponseDto: apiResponse.data,
      );
    }
    throw ServerException(
      errorModel: ErrorModel(
        status: 400,
        errorMessage: apiResponse.message ?? errorContext,
      ),
    );
  }
}
