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
        userId: json['userID'] as int?,
        userName: json['userName'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        permissions: json['permissions'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'userID': userId,
        'userName': userName,
        'email': email,
        'phone': phone,
        'permissions': permissions,
      };

  @override
  List<Object?> get props {
    return [
      userId,
      userName,
      email,
      phone,
      permissions,
    ];
  }
}
