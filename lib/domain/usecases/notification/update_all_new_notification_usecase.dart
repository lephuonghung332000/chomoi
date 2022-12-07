import 'package:chomoi/app/core/usecases/no_param_usecase.dart';
import 'package:chomoi/data/repositories/notification/notification_repository_impl.dart';
import 'package:chomoi/domain/repositories/notification/notification_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UpdateAllNewNotificationUseCase
    extends NoParamUseCase<Either<DioError, Unit>> {
  late final NotificationRepository _repo;

  UpdateAllNewNotificationUseCase({NotificationRepository? notificationRepository}) {
    _repo = notificationRepository ?? NotificationRepositoryImpl();
  }

  @override
  Future<Either<DioError, Unit>> call() {
    return _repo.updateAllNewNotifications();
  }
}
