// Package imports:
import 'package:chomoi/domain/models/request/auth/login_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';

@JsonSerializable()
class LoginRequestDto {
  final String email;
  final String password;

  LoginRequestDto({
    required this.email,
    required this.password,
  });

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);

  factory LoginRequestDto.fromModel(LoginRequestModel model) {
    return LoginRequestDto(
      email: model.email,
      password: model.password,
    );
  }

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);
}
