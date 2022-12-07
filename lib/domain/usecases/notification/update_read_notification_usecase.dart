import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/notification/notification_repository_impl.dart';
import 'package:chomoi/domain/models/request/notification/fcm_token_request_model.dart';
import 'package:chomoi/domain/repositories/notification/notification_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UpdateReadNotificationUseCase
    extends ParamUseCase<Either<DioError, Unit>, String> {
  late final NotificationRepository _repo;

  UpdateReadNotificationUseCase(
      {NotificationRepository? notificationRepository}) {
    _repo = notificationRepository ?? NotificationRepositoryImpl();
  }

  @override
  Future<Either<DioError, Unit>> call(params) {
    return _repo.updateRead(notificationId: params);
  }
}
