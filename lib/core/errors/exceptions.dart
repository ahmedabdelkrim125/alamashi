
import 'package:egyptian_supermaekat/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;
  final int? statusCode;

  ServerException({
    this.statusCode,
    required this.errorModel,
  });

  @override
  String toString() {
    return 'ServerException(statusCode: $statusCode, message: ${errorModel.errorMessage})';
  }
}