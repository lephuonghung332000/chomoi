import 'package:json_annotation/json_annotation.dart';

part 'sign_up_information_dto.g.dart';

@JsonSerializable()
class SignUpInformationDto {
  SignUpInformationDto({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final SignUpData data;

  factory SignUpInformationDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpInformationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpInformationDtoToJson(this);
}

@JsonSerializable()
class SignUpData {
  factory SignUpData.fromJson(Map<String, dynamic> json) => _$SignUpDataFromJson(json);

  SignUpData({
    required this.id,
    required this.token,
  });

  final String id;
  final String token;

  Map<String, dynamic> toJson() => _$SignUpDataToJson(this);
}
