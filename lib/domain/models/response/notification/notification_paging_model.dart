import 'package:chomoi/data/dto/response/notification/notification_paging_dto.dart';
import 'package:chomoi/domain/models/response/notification/notification_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_paging_model.freezed.dart';

@freezed
class NotificationPagingModel with _$NotificationPagingModel {
  factory NotificationPagingModel({
    required int total,
    required List<NotificationModel> notifications,
  }) = _NotificationPagingModel;

  factory NotificationPagingModel.empty() => NotificationPagingModel(
    total: -1,
    notifications: [],
  );

  factory NotificationPagingModel.fromDto(NotificationPagingDto dto) {
    return NotificationPagingModel(
      notifications: NotificationModel.fromDto(
        dto,
      ),
      total: dto.total,
    );
  }
}