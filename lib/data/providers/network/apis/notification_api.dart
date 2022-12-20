import 'dart:convert';

import 'package:chomoi/data/dto/request/notification/fcm_token_request_dto.dart';
import 'package:chomoi/data/providers/network/api_provider.dart';
import 'package:chomoi/data/providers/network/api_request_representable.dart';

enum NotificationType {
  fetchNotification,
  updateRead,
  updateFcmToken,
  deleteFcmToken,
  updateAllNewNotifications,
  getUnReadNotification,
}

class NotificationApi implements APIRequestRepresentable {
  final NotificationType type;
  final int? page;
  final String? notificationId;
  final String? fcmToken;
  final FcmTokenRequestDto? fcmTokenRequestDto;
  final String? userId;

  NotificationApi._({
    required this.type,
    this.page,
    this.notificationId,
    this.fcmToken,
    this.userId,
    this.fcmTokenRequestDto,
  });

  NotificationApi.fetchNotification({int? page, required String userId})
      : this._(
          type: NotificationType.fetchNotification,
          page: page,
          userId: userId,
        );

  NotificationApi.updateRead({required String notificationId})
      : this._(
          type: NotificationType.updateRead,
          notificationId: notificationId,
        );

  NotificationApi.updateFcmToken(
      {required FcmTokenRequestDto fcmTokenRequestDto, required String userId})
      : this._(
          type: NotificationType.updateFcmToken,
          fcmTokenRequestDto: fcmTokenRequestDto,
          userId: userId,
        );

  NotificationApi.deleteFcmToken({required String fcmToken})
      : this._(
          type: NotificationType.deleteFcmToken,
          fcmToken: fcmToken,
        );

  NotificationApi.updateAllNewNotifications()
      : this._(
          type: NotificationType.updateAllNewNotifications,
        );

  NotificationApi.getUnReadNotification()
      : this._(
          type: NotificationType.getUnReadNotification,
        );

  @override
  String get endpoint => 'notification';

  @override
  String get path {
    switch (type) {
      case NotificationType.fetchNotification:
        return '/$userId';
      case NotificationType.updateRead:
        return '/read/$notificationId';
      case NotificationType.updateFcmToken:
        return '/updateFCMTokens/$userId';
      case NotificationType.deleteFcmToken:
        return '/removeFcmToken/$fcmToken';
      case NotificationType.updateAllNewNotifications:
        return '/unread/update';
      case NotificationType.getUnReadNotification:
        return '/unread';
    }
  }

  @override
  Map<String, String> get headers {
    return {};
  }

  @override
  Map<String, String>? get query {
    switch (type) {
      case NotificationType.fetchNotification:
        final Map<String, String> queryPost = {
          'page': '$page',
        };
        return queryPost;
      default:
        return null;
    }
  }

  @override
  String? get body {
    switch (type) {
      case NotificationType.updateFcmToken:
        return jsonEncode(fcmTokenRequestDto!.toJson());
      default:
        return null;
    }
  }

  @override
  Future request() {
    switch (type) {
      case NotificationType.fetchNotification:
      case NotificationType.getUnReadNotification:
        return APIProvider.instance.get(this);
      case NotificationType.updateRead:
      case NotificationType.updateAllNewNotifications:
        return APIProvider.instance.patch(this);
      case NotificationType.updateFcmToken:
        return APIProvider.instance.post(this);
      case NotificationType.deleteFcmToken:
        return APIProvider.instance.delete(this);
    }
  }

  @override
  String get url => endpoint + path;
}
