// Dart imports:
import 'dart:convert';
import 'package:app_settings/app_settings.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/constant/broadcast_message.dart';
import 'package:chomoi/app/services/auth_service.dart';
import 'package:chomoi/app/services/notification_service.dart';
import 'package:chomoi/app/types/notification/notification_enum.dart';
import 'package:chomoi/app/util/get_cupertino_dialog.dart';
import 'package:chomoi/app/util/url_launcher.dart';
import 'package:chomoi/domain/models/request/notification/fcm_token_request_model.dart';
import 'package:chomoi/domain/usecases/notification/delete_fcm_token_usecase.dart';
import 'package:chomoi/domain/usecases/notification/parse_notifications_usecase.dart';
import 'package:chomoi/domain/usecases/notification/update_fcm_token_usecase.dart';
import 'package:chomoi/presentation/controllers/main/main_controller.dart';
import 'package:chomoi/presentation/pages/main/main_page.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

abstract class FirebaseMessageService {
  static FirebaseMessageService get get => Get.find<FirebaseMessageService>();

  Future<void> routeToCachingRemoteNotificationIfNeeded();

  Future<AuthorizationStatus> getNotificationsAuthorizationStatus();

  Future<bool> enableRemoteNotifications({
    bool openSettingsIfPermissionDenied = false,
  });

  Future<bool> startListenRemoteNotificationsIfPossible();

  void removeFCMTokenFromServer();
}

class FirebaseMessageServiceImpl extends GetxService
    implements FirebaseMessageService {
  FirebaseMessageServiceImpl(
      {UpdateFcmTokenUseCase? updateFCMTokenUseCase,
      DeleteFcmTokenUseCase? deleteFcmTokenUseCase,
      ParseNotificationUseCase? parseNotificationUseCase}) {
    this.updateFCMTokenUseCase =
        updateFCMTokenUseCase ?? UpdateFcmTokenUseCase();
    this.deleteFcmTokenUseCase =
        deleteFcmTokenUseCase ?? DeleteFcmTokenUseCase();
    this.parseNotificationUseCase =
        parseNotificationUseCase ?? ParseNotificationUseCaseImpl();
    startListenRemoteNotificationsIfPossible();
  }

  late final UpdateFcmTokenUseCase updateFCMTokenUseCase;
  late final DeleteFcmTokenUseCase deleteFcmTokenUseCase;
  late final ParseNotificationUseCase parseNotificationUseCase;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  String? _fcmToken;

  @override
  Future<void> routeToCachingRemoteNotificationIfNeeded() async {
    final remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (remoteMessage == null) {
      return;
    }

    _routeToMessageDestinationIfPossible(remoteMessage.data);
  }

  @override
  Future<AuthorizationStatus> getNotificationsAuthorizationStatus() async {
    final notificationSettings =
        await FirebaseMessaging.instance.getNotificationSettings();
    return notificationSettings.authorizationStatus;
  }

  @override
  Future<bool> enableRemoteNotifications({
    bool openSettingsIfPermissionDenied = true,
  }) async {
    NotificationSettings notificationSettings =
        await FirebaseMessaging.instance.getNotificationSettings();

    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.notDetermined) {
      notificationSettings =
          await FirebaseMessaging.instance.requestPermission();
    }

    if (notificationSettings.authorizationStatus ==
            AuthorizationStatus.denied &&
        openSettingsIfPermissionDenied) {
      _showNotificationsDeniedDialog();
      return false;
    }

    if (notificationSettings.authorizationStatus ==
            AuthorizationStatus.authorized ||
        notificationSettings.authorizationStatus ==
            AuthorizationStatus.provisional) {
      FirebaseMessaging.instance.getToken().then(
        (token) {
          if (token != null) {
            updateFCMTokenToServer(token);
          }
        },
      );
      _listenRemoteNotifications();
      return true;
    }

    return false;
  }

  @override
  Future<bool> startListenRemoteNotificationsIfPossible() async {
    final authorizationStatus = await getNotificationsAuthorizationStatus();
    if (authorizationStatus == AuthorizationStatus.denied ||
        authorizationStatus == AuthorizationStatus.notDetermined) {
      return false;
    }

    _listenRemoteNotifications();
    return true;
  }

  void _listenRemoteNotifications() {
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.onTokenRefresh.listen(updateFCMTokenToServer);

    FirebaseMessaging.onMessage.listen(_onReceiveMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(_onReceiveMessageOpenedApp);

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final initializationSettingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: _onSelectNotification);
  }

  void _routeToMessageDestinationIfPossible(Map<String, dynamic> data) {
    if (!AuthService.get.isLoggedIn()) {
      return;
    }

    final url = parseNotificationUseCase.getUrl(data);
    if (url.isEmpty) {
      Get.find<MainController>().navigateToPage(TabType.my_post);
      return;
    } else {
      UrlLauncher.openUrl(url);
    }
  }

  Future<void> updateFCMTokenToServer(String token) async {
    _fcmToken = token;
    await updateFCMTokenUseCase.call(FcmTokenRequestModel(token: token));
  }

  @override
  void removeFCMTokenFromServer() async {
    final token = _fcmToken;
    if (token != null && AuthService.get.isLoggedIn()) {
      deleteFcmTokenUseCase.call(token);
    }
    _fcmToken = null;
    FirebaseMessaging.instance.deleteToken();
  }

  //fix receive message twice
  static int _semaphore = 0;

  void _onReceiveMessage(RemoteMessage remoteMessage) {
    if (_semaphore != 0) {
      return;
    }
    _semaphore = 1;
    Future.delayed(const Duration(milliseconds: 100))
        .then((_) => _semaphore = 0);
    // When app is running.
    if (!AuthService.get.isLoggedIn()) {
      return;
    }

    // Refresh notifications screen
    NotificationsService.get.getNotifications(isLoadScreen: false);

    //if user in notification screen --> update new notification to false
    if (NotificationsService.get.isOpenedNotificationsTab.value) {
      NotificationsService.get.updateAllReadNotification();
    }

    final notification = parseNotificationUseCase.parseMap(remoteMessage.data);

    _broadcastNotification(notification);

    // Display notification banner if possible
    _showRemoteMessageInLocalNotification(remoteMessage);
  }

  void _broadcastNotification(NotificationType? notification) {
    // Refresh my post page and hospitalized screen if notification type is Patient

    if (notification == NotificationType.ads) {
      FBroadcast.instance().broadcast(BroadcastMessages.reloadAds, value: true);
    } else {
      FBroadcast.instance()
          .broadcast(BroadcastMessages.reloadMyPost, value: true);
    }
  }

  void _onReceiveMessageOpenedApp(RemoteMessage remoteMessage) {
    // When use open app via clicking on notification banner in home screen.
    _routeToMessageDestinationIfPossible(remoteMessage.data);
  }

  void _showRemoteMessageInLocalNotification(RemoteMessage remoteMessage) {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'cho moi',
      'Chợ mới',
      channelDescription: 'Thông báo Chợ Mới',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const IOSNotificationDetails iOSPlatformChannelSpecifics =
        IOSNotificationDetails(
      threadIdentifier: 'cho moi',
      presentAlert: true,
      presentBadge: false,
      presentSound: true,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    _flutterLocalNotificationsPlugin.show(
      0,
      remoteMessage.notification?.title,
      remoteMessage.notification?.body,
      platformChannelSpecifics,
      payload: jsonEncode(remoteMessage.data),
    );
  }

  void _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    if (payload == null) {
      return;
    }

    final data = jsonDecode(payload);
    _routeToMessageDestinationIfPossible(data);
  }

  void _onSelectNotification(String? payload) {
    if (payload == null) {
      return;
    }

    final data = jsonDecode(payload);
    _routeToMessageDestinationIfPossible(data);
  }

  void _showNotificationsDeniedDialog() {
    const title = AppStrings.settings_notification_push;
    const content = AppStrings.content_notification_push;

    Get.cupertinoDialog(
      title: title,
      middleText: content,
      textCancel: AppStrings.cancel,
      textConfirm: AppStrings.button_ok,
      onConfirm: () {
        Get.back();
        AppSettings.openAppSettings();
      },
      barrierDismissible: false,
    );
  }
}
