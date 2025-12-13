import 'dart:developer';
import 'package:egyptian_supermaekat/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/login_response_dto.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user_model.dart';
import 'package:egyptian_supermaekat/features/auth/data/repo/auth_repo.dart';
import 'package:egyptian_supermaekat/features/auth/presentation/utils/token_validator.dart';

class CheckAuthStatusUseCase {
  final AuthRepo repository;
  final AuthLocalDataSource localDataSource;

  CheckAuthStatusUseCase({
    required this.repository,
    required this.localDataSource,
  });

  Future<UserModel?> call() async {
    final accessToken = localDataSource.getAccessToken();
    
    log("Checking auth status...");
    log("Access token: ${accessToken != null ? 'present' : 'null'}");

    if (accessToken == null || accessToken.isEmpty) {
      log("No token found. User needs to log in.");
      return null;
    }

    if (TokenValidator.isTokenExpired(accessToken)) {
      log("Access Token has expired. Attempting to refresh...");
      return await _refreshExpiredToken();
    }

    log("Found valid token. User is already logged in.");
    return _buildUserModelFromToken(accessToken);
  }

  Future<UserModel?> _refreshExpiredToken() async {
    try {
      final newUserModel = await repository.refreshToken();
      log("Token refreshed successfully!");
      return newUserModel;
    } catch (e) {
      log("Failed to refresh token. Logging out. Error: $e");
      await localDataSource.clearTokens();
      return null;
    }
  }

  UserModel _buildUserModelFromToken(String accessToken) {
    final user = TokenValidator.extractUserFromToken(accessToken);
    
    return UserModel(
      status: 'success',
      loginResponseDto: LoginResponseDto(
        accessToken: accessToken,
        user: user,
        refreshToken: localDataSource.getRefreshToken(),
      ),
    );
  }
}
