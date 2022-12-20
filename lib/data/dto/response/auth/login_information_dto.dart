import 'package:json_annotation/json_annotation.dart';

part 'login_information_dto.g.dart';

@JsonSerializable()
class LoginInformationDto {
  LoginInformationDto({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final LoginData data;

  factory LoginInformationDto.fromJson(Map<String, dynamic> json) =>
      _$LoginInformationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInformationDtoToJson(this);
}
@JsonSerializable()
class LoginData {
  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);

  LoginData({
    required this.id,
    required this.token,
  });

  final String id;
  final String token;

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
