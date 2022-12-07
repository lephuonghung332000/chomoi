import 'package:chomoi/app/services/notification_service.dart';
import 'package:chomoi/app/types/notification/notification_enum.dart';
import 'package:chomoi/app/util/url_launcher.dart';
import 'package:chomoi/domain/models/response/notification/notification_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/notification/update_read_notification_usecase.dart';
import 'package:chomoi/presentation/controllers/main/main_controller.dart';
import 'package:chomoi/presentation/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final _notifications = NotificationsService.get.notifications;

  List<NotificationModel> get notifications => _notifications.toList();

  final _isLoadingNotification = NotificationsService.get.isLoadingNotification;

  bool get isLoadingNotification => _isLoadingNotification.value;

  final _state = NotificationsService.get.notificationState.obs;

  States<List<NotificationModel>> get state => _state.value;

  final UpdateReadNotificationUseCase updateReadNotificationUseCase;

  NotificationController({
    required this.updateReadNotificationUseCase,
  });

  Worker? _stateTracker;
  Worker? _notificationsTracker;
  Worker? _pageTracker;

  final _notificationPage = NotificationsService.get.notificationPage;

  @override
  void onInit() {
    _initWorker();
    super.onInit();
  }

  void onRefresh() {
    NotificationsService.get.getNotifications(isLoadScreen: true);
  }

  void _initWorker() {
    _stateTracker =
        NotificationsService.get.addNotificationsStateListener((value) {
      _state.value = value;
    });
    _pageTracker =
        NotificationsService.get.addNotificationsPageListener((value) {
      _notificationPage.value = value;
    });
    _notificationsTracker =
        NotificationsService.get.addNotificationsListener((value) {
      _notifications.value = value;
    });
  }

  bool onNotification(ScrollNotification notification) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      NotificationsService.get.getNotifications(
        isLoadScreen: true,
        page: _notificationPage.value + 1,
      );
    }

    return false;
  }

  @override
  void onClose() {
    _stateTracker?.dispose();
    _notificationsTracker?.dispose();
    _pageTracker?.dispose();
    super.onClose();
  }

  void routeToNotificationDetail(NotificationModel notification) {
    final url =
        notification.type == NotificationType.ads ? notification.content : '';
    if(!notification.isRead){
      updateReadNotificationUseCase.call(notification.id);
    }
    // not ads
    if (url.isEmpty) {
      _routeMyPost();
    } else {
      _routeToUrl(url);
    }
  }

  void _routeToUrl(String url) {
    UrlLauncher.openUrl(url).then((value) {
      NotificationsService.get.getNotifications(isLoadScreen: false);
    });
  }

  void _routeMyPost() {
    Get.find<MainController>().navigateToPage(TabType.my_post);
  }
}
