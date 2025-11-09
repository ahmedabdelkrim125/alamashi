// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  status: json['status'] as String?,
  loginResponseDto: json['loginResponseDto'] == null
      ? null
      : LoginResponseDto.fromJson(
          json['loginResponseDto'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'status': instance.status,
  'loginResponseDto': instance.loginResponseDto,
};
