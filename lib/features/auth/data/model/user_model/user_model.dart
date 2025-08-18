import 'package:egyptian_supermaekat/core/api/end_points.dart';
import 'package:equatable/equatable.dart';
import 'user.dart';

class UserModel extends Equatable {
  final String? status;
  final String? accessToken;
  final String? refreshToken;
  final User? user;

  const UserModel({
    this.status,
    this.accessToken,
    this.refreshToken,
    this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json[ApiKeys.data] as Map<String, dynamic>?; // <<<< مهم
    return UserModel(
      status: json[ApiKeys.status] as String?,
      accessToken: data?[ApiKeys.accessToken] as String?,
      refreshToken: data?[ApiKeys.refreshToken] as String?,
      user: data?[ApiKeys.user] == null
          ? null
          : User.fromJson(data?[ApiKeys.user] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        ApiKeys.status: status,
        ApiKeys.data: {
          ApiKeys.accessToken: accessToken,
          ApiKeys.refreshToken: refreshToken,
          ApiKeys.user: user?.toJson(),
        }
      };

  @override
  List<Object?> get props => [status, accessToken, refreshToken, user];
}
