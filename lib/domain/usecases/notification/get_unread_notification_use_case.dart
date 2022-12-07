import 'package:chomoi/app/core/usecases/no_param_usecase.dart';
import 'package:chomoi/data/repositories/notification/notification_repository_impl.dart';
import 'package:chomoi/domain/models/response/notification/unread_notification_model.dart';
import 'package:chomoi/domain/repositories/notification/notification_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class GetUnreadNotificationUseCase
    extends NoParamUseCase<Either<DioError, UnreadNotificationModel>> {
  late final NotificationRepository _repo;

  GetUnreadNotificationUseCase(
      {NotificationRepository? notificationRepository}) {
    _repo = notificationRepository ?? NotificationRepositoryImpl();
  }

  @override
  Future<Either<DioError, UnreadNotificationModel>> call() {
    return _repo.getUnReadNotification();
  }
}
