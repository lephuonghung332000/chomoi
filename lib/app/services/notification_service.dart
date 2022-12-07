import 'dart:async';
import 'package:chomoi/app/services/auth_service.dart';
import 'package:chomoi/app/services/firebase_message_service.dart';
import 'package:chomoi/domain/models/response/notification/notification_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/notification/fetch_notification_use_case.dart';
import 'package:chomoi/domain/usecases/notification/get_unread_notification_use_case.dart';
import 'package:chomoi/domain/usecases/notification/update_all_new_notification_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:get/get.dart';

abstract class NotificationsService {
  static NotificationsService get get => Get.find<NotificationsService>();

  RxBool get isOpenedNotificationsTab;

  void setIsOpenedNotification(bool value);

  void refreshNotificationsTabIfPossible();

  RxBool get inNotificationTab;

  void setInNotificationTab(bool value);

  RxBool get isLoadingNotification;

  RxInt get notificationsBadge;

  RxInt get notificationPage;

  Future<void> getNotifications({
    bool isLoadScreen = false,
    int page = 1,
  });

  Future<void> updateAllReadNotification();

  States<List<NotificationModel>> get notificationState;

  Worker addOpenedNotificationsTabListener(void Function(bool value) listener);

  Worker addNotificationsBadgeListener(void Function(int value) listener);

  Worker addNotificationsStateListener(
      void Function(States<List<NotificationModel>> value) listener);

  Worker addLoadingNotificationListener(void Function(bool value) listener);

  Worker addNotificationsListener(
      void Function(List<NotificationModel> value) listener);

  Worker addNotificationsPageListener(void Function(int value) listener);

  late RxList<NotificationModel> notifications;

  void clear();
}

class NotificationsServiceImpl extends GetxService
    implements NotificationsService {
  late final FetchNotificationUseCase fetchNotificationUseCase;
  late final GetUnreadNotificationUseCase getUnreadNotificationUseCase;
  late final UpdateAllNewNotificationUseCase updateAllNewNotificationUseCase;
  int _total = 0;

  @override
  RxInt notificationPage = 1.obs;

  @override
  final RxBool isLoadingNotification = false.obs;

  @override
  Worker addNotificationsPageListener(void Function(int value) listener) {
    return ever<int>(notificationPage, listener);
  }

  @override
  Worker addNotificationsListener(
      ValueChanged<List<NotificationModel>> listener) {
    return ever<List<NotificationModel>>(notifications, listener);
  }

  @override
  States<List<NotificationModel>> get notificationState =>
      _notificationState.value;

  final _notificationState = const States<List<NotificationModel>>.init(
    entity: [],
  ).obs;

  NotificationsServiceImpl({
    FetchNotificationUseCase? fetchNotificationUseCase,
    GetUnreadNotificationUseCase? getUnreadNotificationUseCase,
    UpdateAllNewNotificationUseCase? updateAllNewNotificationUseCase,
  }) {
    this.fetchNotificationUseCase =
        fetchNotificationUseCase ?? FetchNotificationUseCase();
    this.getUnreadNotificationUseCase =
        getUnreadNotificationUseCase ?? GetUnreadNotificationUseCase();
    this.updateAllNewNotificationUseCase =
        updateAllNewNotificationUseCase ?? UpdateAllNewNotificationUseCase();
  }

  Worker? _notificationBadgeListener;

  @override
  RxList<NotificationModel> notifications = RxList();

  @override
  void onReady() {
    _notificationBadgeListener =
        NotificationsService.get.addNotificationsBadgeListener((value) {
      _updateBadgeCount(value);
    });

    super.onReady();
  }

  @override
  Worker addLoadingNotificationListener(void Function(bool value) listener) {
    return ever<bool>(isLoadingNotification, listener);
  }

  @override
  void onClose() {
    _notificationBadgeListener?.dispose();

    super.onClose();
  }

  void clearNotifications(){
    _total = 0;
    notificationPage.value = 1;
    _notificationState.value = States.success(entity: notifications);
    notifications.clear();
  }

  @override
  Future<void> getNotifications({
    bool isLoadScreen = false,
    int page = 1,
  }) async {
    if (!AuthService.get.isLoggedIn()) {
      return;
    }

    // clear when reload notifications screen
    if (page == 1) {
      clearNotifications();
    }

    if (_total > 0 && notifications.length >= _total) {
      return;
    }

    if (isLoadingNotification.value) {
      return;
    }

    if (isLoadScreen) {
      isLoadingNotification.value = true;
    }

    // After fetching, check if user is in notification tab then set badge to 0.
    // If user is in another screen then count unread notifications and set to badge
    // If in notification tab, we must change screen's state
    if (isLoadScreen && page == 1) {
      _notificationState.value = const States.loading();
    }
    final result = await fetchNotificationUseCase.call(page);
    result.fold((failure) {
      if (page == 1) {
        _notificationState.value = States.failure(failure);
      }
    }, (value) async {
      notificationPage.value = page;
      _total = value.total;
      notifications.addAll(value.notifications);
      _notificationState.value = States.success(entity: notifications);
      _notificationState.refresh();

      if (!inNotificationTab.value) {
        final resultCount = await getUnreadNotificationUseCase.call();
        resultCount.fold((failure) {
          if (page == 1) {
            _notificationState.value = States.failure(failure);
          }
        }, (value) async {
          _setNotificationsBadge(value.total);
          _updateBadgeCount(value.total);
        });
      }
    });
    if (isLoadScreen) {
      isLoadingNotification.value = false;
    }
  }

  @override
  final RxBool isOpenedNotificationsTab = false.obs;

  @override
  final RxBool inNotificationTab = false.obs;

  @override
  final RxInt notificationsBadge = 0.obs;

  @override
  Worker addOpenedNotificationsTabListener(void Function(bool value) listener) {
    return ever<bool>(isOpenedNotificationsTab, listener);
  }

  @override
  Worker addNotificationsBadgeListener(void Function(int value) listener) {
    return ever<int>(notificationsBadge, listener);
  }

  @override
  Worker addNotificationsStateListener(
      ValueChanged<States<List<NotificationModel>>> listener) {
    return ever<States<List<NotificationModel>>>(_notificationState, listener);
  }

  @override
  void refreshNotificationsTabIfPossible() {
    if (!inNotificationTab.value) {
      setIsOpenedNotification(false);
      getNotifications(isLoadScreen: false);
    }
  }

  @override
  void setIsOpenedNotification(bool value) async {
    isOpenedNotificationsTab.value = value;
    if (value) {
      _removeAppBadge();
    }
  }

  @override
  void setInNotificationTab(bool value) {
    inNotificationTab.value = value;
  }

  @override
  void clear() {
    setIsOpenedNotification(false);
    notifications.clear();
    _notificationState.value = const States<List<NotificationModel>>.init(
      entity: [],
    );
    _setNotificationsBadge(0);
  }

  void _setNotificationsBadge(int value) {
    notificationsBadge.value = value;
  }

  void _updateBadgeCount(int count) async {
    if (await FirebaseMessageService.get
            .getNotificationsAuthorizationStatus() !=
        AuthorizationStatus.authorized) {
      return;
    }

    if (count <= 0) {
      _removeAppBadge();
    } else {
      if (await FlutterAppBadger.isAppBadgeSupported()) {
        FlutterAppBadger.updateBadgeCount(count);
      }
    }
  }

  void _removeAppBadge() async {
    if (await FlutterAppBadger.isAppBadgeSupported()) {
      FlutterAppBadger.removeBadge();
    }
  }

  @override
  Future<void> updateAllReadNotification() async {
    await updateAllNewNotificationUseCase.call();
  }
}
