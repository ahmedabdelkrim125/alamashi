import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto {
  @JsonKey(name: 'accessToken')
  final String? accessToken;
  
  @JsonKey(name: 'refreshToken')
  final String? refreshToken;
  
  @JsonKey(name: 'user')
  final User? user;

  LoginResponseDto({
    this.accessToken,
    this.refreshToken,
    this.user,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);
}