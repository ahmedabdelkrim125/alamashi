import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String userName;
  final String email;
  final String password;
  final String phone;

  RegisterRequest({
    required this.userName,
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}