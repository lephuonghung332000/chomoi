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
  final String data;

  factory SignUpInformationDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpInformationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpInformationDtoToJson(this);
}

