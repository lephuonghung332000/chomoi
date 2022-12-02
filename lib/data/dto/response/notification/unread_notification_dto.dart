import 'package:json_annotation/json_annotation.dart';

part 'unread_notification_dto.g.dart';

@JsonSerializable()
class UnreadNotificationDto {
  UnreadNotificationDto({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final int data;

  factory UnreadNotificationDto.fromJson(Map<String, dynamic> json) => _$UnreadNotificationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UnreadNotificationDtoToJson(this);
}