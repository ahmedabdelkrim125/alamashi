import 'package:egyptian_supermaekat/core/api/end_points.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? userId;
  final String? userName;
  final String? email;
  final String? phone;
  final int? permissions;

  const User({
    this.userId,
    this.userName,
    this.email,
    this.phone,
    this.permissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json[ApiKeys.userId] as int?,
        userName: json[ApiKeys.userName] as String?,
        email: json[ApiKeys.email] as String?,
        phone: json[ApiKeys.phone] as String?,
        permissions: int.tryParse(json[ApiKeys.permissions]?.toString() ?? ''),
      );

  Map<String, dynamic> toJson() => {
        ApiKeys.userId: userId,
        ApiKeys.userName: userName,
        ApiKeys.email: email,
        ApiKeys.phone: phone,
        ApiKeys.permissions: permissions,
      };

  @override
  List<Object?> get props => [userId, userName, email, phone, permissions];
}
