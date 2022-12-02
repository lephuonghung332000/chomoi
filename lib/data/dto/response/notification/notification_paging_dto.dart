import 'package:chomoi/app/types/notification/notification_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_paging_dto.g.dart';

@JsonSerializable()
class NotificationPagingDto {
  NotificationPagingDto({
    required this.success,
    required this.message,
    required this.total,
    required this.data,
  });

  final bool success;
  final String message;
  final int total;
  final List<NotificationData> data;

  factory NotificationPagingDto.fromJson(Map<String, dynamic> json) => _$NotificationPagingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationPagingDtoToJson(this);
}

@JsonSerializable()
class NotificationData {
  factory NotificationData.fromJson(Map<String, dynamic> json) => _$NotificationDataFromJson(json);

  NotificationData({
    required this.id,
    required this.userId,
    required this.content,
    required this.createAt,
    required this.title,
    required this.type,
    required this.isNew,
    required this.isRead
  });

  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  final String content;
  @JsonKey(name: 'create_at')
  final double createAt;
  final NotificationType type;
  final String title;
  final bool isNew;
  final bool isRead;

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}
