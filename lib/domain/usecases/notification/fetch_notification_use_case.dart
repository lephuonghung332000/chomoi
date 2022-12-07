import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/notification/notification_repository_impl.dart';
import 'package:chomoi/domain/models/response/notification/notification_paging_model.dart';
import 'package:chomoi/domain/repositories/notification/notification_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchNotificationUseCase
    extends ParamUseCase<Either<DioError, NotificationPagingModel>, int?> {
  late final NotificationRepository _repo;

  FetchNotificationUseCase({NotificationRepository? notificationRepository}) {
    _repo = notificationRepository ?? NotificationRepositoryImpl();
  }

  @override
  Future<Either<DioError, NotificationPagingModel>> call(params) {
    return _repo.fetchNotification(
      page: params,
    );
  }
}
