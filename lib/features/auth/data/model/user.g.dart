// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  userId: (json['userID'] as num?)?.toInt(),
  userName: json['userName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  permissions: (json['permissions'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'userID': instance.userId,
  'userName': instance.userName,
  'email': instance.email,
  'phone': instance.phone,
  'permissions': instance.permissions,
};
