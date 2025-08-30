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
    final responseData = json[ApiKeys.response] as Map<String, dynamic>?;
    return UserModel(
      status: json[ApiKeys.status] as String?,
      accessToken: responseData?[ApiKeys.accessToken] as String?,
      refreshToken: responseData?[ApiKeys.refreshToken] as String?,
      user: responseData?[ApiKeys.user] == null
          ? null
          : User.fromJson(responseData?[ApiKeys.user] as Map<String, dynamic>),
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
