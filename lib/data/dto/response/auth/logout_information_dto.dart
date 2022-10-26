import 'package:json_annotation/json_annotation.dart';

part 'logout_information_dto.g.dart';

@JsonSerializable()
class LogoutInformationDto {
  LogoutInformationDto({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final String data;

  factory LogoutInformationDto.fromJson(Map<String, dynamic> json) =>
      _$LogoutInformationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutInformationDtoToJson(this);
}
