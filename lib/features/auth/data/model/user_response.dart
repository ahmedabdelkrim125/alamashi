import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'status')
  final String? status;
  
  @JsonKey(name: 'data')
  final User? user;

  UserResponse({
    this.status,
    this.user,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}