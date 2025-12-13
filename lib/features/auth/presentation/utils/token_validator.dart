import 'dart:developer';
import 'package:egyptian_supermaekat/core/api/end_points.dart';
import 'package:egyptian_supermaekat/features/auth/data/model/user.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenValidator {
  static bool isTokenExpired(String token) {
    try {
      return JwtDecoder.isExpired(token);
    } catch (e) {
      log("Error checking token expiry: $e");
      return true;
    }
  }

  static Map<String, dynamic> decodeToken(String token) {
    try {
      return JwtDecoder.decode(token);
    } catch (e) {
      log("Error decoding token: $e");
      rethrow;
    }
  }

  static DateTime getExpiryDate(String token) {
    try {
      return JwtDecoder.getExpirationDate(token);
    } catch (e) {
      log("Error getting expiry date: $e");
      rethrow;
    }
  }

  static User extractUserFromToken(String token) {
    try {
      final decoded = decodeToken(token);

      log("--- Decoded Token Info ---");
      log("User Role: ${decoded[ApiKeys.jwtRole]}");
      log("User ID: ${decoded[ApiKeys.jwtNameIdentifier]}");
      log("Username: ${decoded[ApiKeys.jwtName]}");
      log("Email: ${decoded[ApiKeys.jwtEmail]}");
      log("---------------------------");

      return User(
        userId: int.tryParse(
          decoded[ApiKeys.jwtNameIdentifier]?.toString() ?? '0',
        ) ?? 0,
        userName: decoded[ApiKeys.jwtName],
        email: decoded[ApiKeys.jwtEmail],
      );
    } catch (e) {
      log("Error extracting user from token: $e");
      rethrow;
    }
  }

  static void logTokenExpiry(String token) {
    try {
      final expiryDate = getExpiryDate(token);
      final now = DateTime.now();
      final difference = expiryDate.difference(now);
      
      log("Token will expire on: $expiryDate");
      log("Time remaining: ${difference.inHours} hours, ${difference.inMinutes % 60} minutes");
    } catch (e) {
      log("Error logging token expiry: $e");
    }
  }

  static bool isTokenValid(String? token) {
    if (token == null || token.isEmpty) {
      return false;
    }

    try {
      decodeToken(token);
      return !isTokenExpired(token);
    } catch (e) {
      log("Invalid token: $e");
      return false;
    }
  }
}
