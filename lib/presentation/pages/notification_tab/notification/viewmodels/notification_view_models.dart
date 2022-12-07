// Project imports:
import 'package:chomoi/app/types/notification/notification_enum.dart';
import 'package:chomoi/app/util/date_time_extensions.dart';
import 'package:chomoi/app/util/double_extension.dart';
import 'package:chomoi/domain/models/response/notification/notification_model.dart';

class NotificationViewModel {
  final String? title;
  final double? createdAt;
  final NotificationType notificationType;
  final bool isRead;
  final String? content;

  NotificationViewModel({
    this.title,
    this.content,
    this.createdAt,
    required this.notificationType,
    required this.isRead,
  });

  String get timeAgo => createdAt?.toDateTime.timeAgo ?? '';

  factory NotificationViewModel.fromNotifications(NotificationModel model) {
    return NotificationViewModel(
      title: model.title,
      createdAt: model.createAt,
      notificationType: model.type,
      isRead: model.isRead,
      content: model.content,
    );
  }
}
