import 'package:chomoi/data/dto/request/notification/fcm_token_request_dto.dart';
import 'package:chomoi/data/dto/response/notification/notification_paging_dto.dart';
import 'package:chomoi/data/dto/response/notification/unread_notification_dto.dart';
import 'package:chomoi/data/providers/network/apis/notification_api.dart';
import 'package:chomoi/domain/models/request/notification/fcm_token_request_model.dart';
import 'package:chomoi/domain/models/response/notification/notification_paging_model.dart';
import 'package:chomoi/domain/models/response/notification/unread_notification_model.dart';
import 'package:chomoi/domain/repositories/notification/notification_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  @override
  Future<Either<DioError, NotificationPagingModel>> fetchNotification({
    int? page,
    required String userId,
  }) =>
      Task(
        () => NotificationApi.fetchNotification(page: page, userId: userId)
            .request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (response) => NotificationPagingModel.fromDto(
                NotificationPagingDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<DioError, Unit>> deleteFcmToken({required String fcmToken}) =>
      Task(
        () => NotificationApi.deleteFcmToken(
          fcmToken: fcmToken,
        ).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (_) => unit,
            ),
          )
          .run();

  @override
  Future<Either<DioError, UnreadNotificationModel>> getUnReadNotification() =>
      Task(
        () => NotificationApi.getUnReadNotification().request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (response) => UnreadNotificationModel.fromDto(
                UnreadNotificationDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<DioError, Unit>> updateAllNewNotifications() => Task(
        () => NotificationApi.updateAllNewNotifications().request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (_) => unit,
            ),
          )
          .run();

  @override
  Future<Either<DioError, Unit>> updateFcmToken(
          FcmTokenRequestModel fcmTokenRequestModel,
          {required String userId}) =>
      Task(
        () => NotificationApi.updateFcmToken(
          fcmTokenRequestDto:
              FcmTokenRequestDto.fromModel(fcmTokenRequestModel),
          userId: userId,
        ).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (_) => unit,
            ),
          )
          .run();

  @override
  Future<Either<DioError, Unit>> updateRead({required String notificationId}) =>
      Task(
        () => NotificationApi.updateRead(
          notificationId: notificationId,
        ).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (_) => unit,
            ),
          )
          .run();
}
