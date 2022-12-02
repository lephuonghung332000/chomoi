import 'package:chomoi/data/dto/response/notification/unread_notification_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unread_notification_model.freezed.dart';

@freezed
class UnreadNotificationModel with _$UnreadNotificationModel {
  factory UnreadNotificationModel({
    required int total,
  }) = _UnreadNotificationModel;

  factory UnreadNotificationModel.empty() => UnreadNotificationModel(
        total: 0,
      );

  factory UnreadNotificationModel.fromDto(UnreadNotificationDto dto) {
    return UnreadNotificationModel(total: dto.data);
  }
}
