import 'package:egyptian_supermaekat/features/auth/data/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'login_response_dto.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'status')
  final String? status;
  
  @JsonKey(name: 'loginResponseDto')
  final LoginResponseDto? loginResponseDto;

  UserModel({
    this.status,
    this.loginResponseDto,
  });

  UserModel.manual({
    required this.status,
    required String? accessToken,
    required String? refreshToken,
    required User? user,
  }) : loginResponseDto = LoginResponseDto(
          accessToken: accessToken,
          refreshToken: refreshToken,
          user: user,
        );

  String? get accessToken => loginResponseDto?.accessToken;
  String? get refreshToken => loginResponseDto?.refreshToken;
  User? get user => loginResponseDto?.user;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}