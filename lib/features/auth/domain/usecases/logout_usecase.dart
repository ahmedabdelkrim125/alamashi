import 'dart:developer';
import 'package:egyptian_supermaekat/features/auth/data/datasources/auth_local_datasource.dart';

class LogoutUseCase {
  final AuthLocalDataSource localDataSource;

  LogoutUseCase(this.localDataSource);

  Future<void> call() async {
    try {
      await localDataSource.clearTokens();
      log('Logout successful. All tokens cleared.');
    } catch (e) {
      log('Error during logout: $e');
      rethrow;
    }
  }
}
