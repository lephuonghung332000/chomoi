import 'dart:async';
import 'package:chomoi/app/services/auth_service.dart';
import 'package:chomoi/domain/models/response/notification/notification_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
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

  RxInt get notificationsBadge;

  Future<void> getNotifications({bool isLoadScreen = false});

  States<List<NotificationModel>> get notificationState;

  Worker addOpenedNotificationsTabListener(void Function(bool value) listener);

  Worker addNotificationsBadgeListener(void Function(int value) listener);

  Worker addNotificationsListener(
      void Function(States<List<NotificationModel>> value) listener);

  void clear();
}

class NotificationsServiceImpl extends GetxService
    implements NotificationsService {
  late GetUserNotificationsUseCase getUserNotificationsUseCase;

  @override
  States<List<NotificationModel>> get notificationState => _notificationState.value;

  final _notificationState = const States<List<NotificationModel>>.init(
    entity: [],
  ).obs;

  NotificationsServiceImpl({
    GetUserNotificationsUseCase? getUserNotificationsUseCase,
  }) {
    this.getUserNotificationsUseCase =
        getUserNotificationsUseCase ?? GetUserNotificationsUseCaseImpl();
  }

  Worker? _demoModeListener;
  Worker? _notificationBadgeListener;

  @override
  void onReady() {
    _notificationBadgeListener =
        NotificationsService.get.addNotificationsBadgeListener((value) {
      _updateBadgeCount(value);
    });

    super.onReady();
  }

  @override
  void onClose() {
    _demoModeListener?.dispose();
    _notificationBadgeListener?.dispose();

    super.onClose();
  }

  @override
  Future<void> getNotifications({bool isLoadScreen = false}) async {
    if (!AuthService.get.isLoggedIn()) {
      return;
    }

    // After fetching, check if user is in notification tab then set badge to 0.
    // If user is in another screen then count unread notifications and set to badge
    // If in notification tab, we must change screen's state
    if (isLoadScreen) {
      setNotificationsScreenState(NotificationsScreenState.loading);
    }
    final result = await getUserNotificationsUseCase.getUserNotifications();
    result.when(success: (success) async {
      if (success == null || success.isEmpty) {
        notifications.value = [];
        if (isLoadScreen) {
          setNotificationsScreenState(NotificationsScreenState.empty);
        }
      } else {
        notifications.value = success;
        if (isLoadScreen) {
          setNotificationsScreenState(NotificationsScreenState.success);
        }
      }

      // count badge notification if we are not in notification tab
      if (!inNotificationTab.value) {
        final count = getUserNotificationsUseCase
            .getUnreadNotificationsCount(notifications.toList());
        _setNotificationsBadge(count);
      }
    }, failure: (error) {
      if (error.dioError?.isDebouncerCancel ?? false) {
        return;
      }
      if (isLoadScreen) {
        setNotificationsScreenState(NotificationsScreenState.error);
      }
    });
  }

  @override
  final RxBool isOpenedNotificationsTab = false.obs;

  @override
  final RxBool inNotificationTab = false.obs;

  @override
  final RxInt notificationsBadge = 0.obs;

  @override
  RxList<UserNotificationResponseModel> notifications = RxList();

  @override
  Worker addOpenedNotificationsTabListener(void Function(bool value) listener) {
    return ever<bool>(isOpenedNotificationsTab, listener);
  }

  @override
  Worker addNotificationsBadgeListener(void Function(int value) listener) {
    return ever<int>(notificationsBadge, listener);
  }

  @override
  Worker addNotificationsListener(
      ValueChanged<List<UserNotificationResponseModel>> listener) {
    return ever<List<UserNotificationResponseModel>>(notifications, listener);
  }

  @override
  Worker addNotificationsScreenStateListener(
      void Function(NotificationsScreenState value) listener) {
    return ever<NotificationsScreenState>(state, listener);
  }

  @override
  void refreshNotificationsTabIfPossible() {
    if (!NotificationsService.get.inNotificationTab.value) {
      NotificationsService.get.setIsOpenedNotification(false);
      NotificationsService.get.getNotifications(isLoadScreen: false);
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
}
