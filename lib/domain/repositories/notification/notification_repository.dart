import 'package:chomoi/data/dto/request/notification/fcm_token_request_dto.dart';
import 'package:chomoi/domain/models/request/notification/fcm_token_request_model.dart';
import 'package:chomoi/domain/models/response/notification/notification_paging_model.dart';
import 'package:chomoi/domain/models/response/notification/unread_notification_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class NotificationRepository {
  Future<Either<DioError, NotificationPagingModel>> fetchNotification({
    int? page,
  });

  Future<Either<DioError, Unit>> updateRead({required String notificationId});

  Future<Either<DioError, Unit>> updateFcmToken(
      FcmTokenRequestModel fcmTokenRequestModel);

  Future<Either<DioError, Unit>> deleteFcmToken({
    required String fcmToken,
  });

  Future<Either<DioError, Unit>> updateAllNewNotifications();

  Future<Either<DioError, UnreadNotificationModel>> getUnReadNotification();
}
