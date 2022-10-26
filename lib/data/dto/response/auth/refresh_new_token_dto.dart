import 'package:json_annotation/json_annotation.dart';

part 'refresh_new_token_dto.g.dart';

@JsonSerializable()
class RefreshNewTokenDto {
  RefreshNewTokenDto({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final String data;

  factory RefreshNewTokenDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshNewTokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshNewTokenDtoToJson(this);
}