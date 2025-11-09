import 'package:egyptian_supermaekat/core/api/end_points.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  @JsonKey(name: ApiKeys.status)
  final String? status;

  @JsonKey(name: ApiKeys.data)
  final T? data;

  @JsonKey(name: ApiKeys.message)
  final String? message;

  ApiResponse({this.status, this.data, this.message});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}
