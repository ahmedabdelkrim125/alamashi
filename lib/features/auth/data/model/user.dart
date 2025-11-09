import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'userID')
  final int? userId;
  
  @JsonKey(name: 'userName')
  final String? userName;
  
  @JsonKey(name: 'email')
  final String? email;
  
  @JsonKey(name: 'phone')
  final String? phone;
  
  @JsonKey(name: 'permissions')
  final int? permissions;

  User({
    this.userId,
    this.userName,
    this.email,
    this.phone,
    this.permissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}