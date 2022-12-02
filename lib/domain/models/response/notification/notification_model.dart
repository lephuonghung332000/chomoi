import 'package:chomoi/app/types/notification/notification_enum.dart';
import 'package:chomoi/data/dto/response/notification/notification_paging_dto.dart';
import 'package:chomoi/data/dto/response/post/post_paging_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';

@freezed
class NotificationModel with _$NotificationModel {
  factory NotificationModel({
    required String id,
    required String userId,
    required String content,
    required double createAt,
    required String title,
    required NotificationType type,
    required bool isNew,
    required bool isRead,
  }) = _NotificationModel;

  factory NotificationModel.empty() => NotificationModel(
        id: '',
        userId: '',
        content: '',
        title: '',
        createAt: -1,
        isNew: false,
        isRead: false,
        type: NotificationType.ads,
      );

  static List<NotificationModel> fromDto(NotificationPagingDto dto) {
    return List<NotificationModel>.from(
      dto.data.map<NotificationModel>(
        (e) => NotificationModel(
          id: e.id,
          userId: e.userId,
          content: e.content,
          title: e.title,
          createAt: e.createAt,
          isNew: e.isNew,
          isRead: e.isRead,
          type: e.type,
        ),
      ),
    );
  }
}
