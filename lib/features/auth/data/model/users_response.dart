import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'users_response.g.dart';

@JsonSerializable()
class UsersResponse {
  @JsonKey(name: 'status')
  final String? status;
  
  @JsonKey(name: 'data')
  final List<User>? users;

  UsersResponse({
    this.status,
    this.users,
  });

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}