import 'package:chomoi/domain/models/request/notification/fcm_token_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fcm_token_request_dto.g.dart';

@JsonSerializable()
class FcmTokenRequestDto {
  final String token;

  FcmTokenRequestDto({
    required this.token,
  });

  factory FcmTokenRequestDto.fromJson(Map<String, dynamic> json) =>
      _$FcmTokenRequestDtoFromJson(json);

  factory FcmTokenRequestDto.fromModel(FcmTokenRequestModel model) {
    return FcmTokenRequestDto(
      token: model.token,
    );
  }

  Map<String, dynamic> toJson() => _$FcmTokenRequestDtoToJson(this);
}
