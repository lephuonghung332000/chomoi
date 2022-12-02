// // Dart imports:
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
//
// abstract class FirebaseMessageService {
//   static FirebaseMessageService get get => Get.find<FirebaseMessageService>();
//
//   Future<void> routeToCachingRemoteNotificationIfNeeded();
//
//   Future<AuthorizationStatus> getNotificationsAuthorizationStatus();
//
//   Future<bool> enableRemoteNotifications({
//     bool openSettingsIfPermissionDenied = false,
//   });
//
//   Future<bool> startListenRemoteNotificationsIfPossible();
//
//   void removeFCMTokenFromServer();
// }
//
// class FirebaseMessageServiceImpl extends GetxService
//     implements FirebaseMessageService {
//   FirebaseMessageServiceImpl(
//       {UpdateFCMTokenUseCase? updateFCMTokenUseCase,
//       ParseNotificationUseCase? parseNotificationUseCase}) {
//     this.updateFCMTokenUseCase =
//         updateFCMTokenUseCase ?? UpdateFCMTokenUseCaseImpl();
//     this.parseNotificationUseCase =
//         parseNotificationUseCase ?? ParseNotificationUseCaseImpl();
//     startListenRemoteNotificationsIfPossible();
//   }
//
//   late final UpdateFCMTokenUseCase updateFCMTokenUseCase;
//   late final ParseNotificationUseCase parseNotificationUseCase;
//
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   String? _fcmToken;
//
//   @override
//   Future<void> routeToCachingRemoteNotificationIfNeeded() async {
//     final remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
//     if (remoteMessage == null) {
//       return;
//     }
//
//     _routeToMessageDestinationIfPossible(remoteMessage.data);
//   }
//
//   @override
//   Future<AuthorizationStatus> getNotificationsAuthorizationStatus() async {
//     final notificationSettings =
//         await FirebaseMessaging.instance.getNotificationSettings();
//     return notificationSettings.authorizationStatus;
//   }
//
//   @override
//   Future<bool> enableRemoteNotifications({
//     bool openSettingsIfPermissionDenied = false,
//   }) async {
//     NotificationSettings notificationSettings =
//         await FirebaseMessaging.instance.getNotificationSettings();
//
//     if (notificationSettings.authorizationStatus ==
//         AuthorizationStatus.notDetermined) {
//       notificationSettings =
//           await FirebaseMessaging.instance.requestPermission();
//     }
//
//     if (notificationSettings.authorizationStatus ==
//             AuthorizationStatus.denied &&
//         openSettingsIfPermissionDenied) {
//       _showNotificationsDeniedDialog();
//       return false;
//     }
//
//     if (notificationSettings.authorizationStatus ==
//             AuthorizationStatus.authorized ||
//         notificationSettings.authorizationStatus ==
//             AuthorizationStatus.provisional) {
//       FirebaseMessaging.instance.getToken().then(
//         (token) {
//           if (token != null) {
//             updateFCMTokenToServer(token);
//           }
//         },
//       );
//       _listenRemoteNotifications();
//       return true;
//     }
//
//     return false;
//   }
//
//   @override
//   Future<bool> startListenRemoteNotificationsIfPossible() async {
//     final authorizationStatus = await getNotificationsAuthorizationStatus();
//     if (authorizationStatus == AuthorizationStatus.denied ||
//         authorizationStatus == AuthorizationStatus.notDetermined) {
//       return false;
//     }
//
//     _listenRemoteNotifications();
//     return true;
//   }
//
//   void _listenRemoteNotifications() {
//     FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     FirebaseMessaging.instance.onTokenRefresh.listen(updateFCMTokenToServer);
//
//     FirebaseMessaging.onMessage.listen(_onReceiveMessage);
//
//     FirebaseMessaging.onMessageOpenedApp.listen(_onReceiveMessageOpenedApp);
//
//     // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//     const initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     final initializationSettingsIOS = IOSInitializationSettings(
//       onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
//     );
//
//     final initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//
//     _flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: _onSelectNotification);
//   }
//
//   void _routeToMessageDestinationIfPossible(Map<String, dynamic> data) {
//     if (!AuthService.get.isLogedIn()) {
//       return;
//     }
//
//     final type = parseNotificationUseCase.parseMap(data);
//     if (type == null) {
//       return;
//     }
//
//     if (type is Invoice) {
//       final invoiceId = type.invoiceId;
//       _routeToInvoiceDetail(invoiceId: invoiceId);
//       return;
//     }
//
//     if (type is Patient) {
//       final patientId = type.patientId;
//       final visitId = type.visitId;
//       _routeToPatientDetail(patientId: patientId, visitId: visitId);
//       return;
//     }
//   }
//
//   Future<void> updateFCMTokenToServer(String token) async {
//     _fcmToken = token;
//     await updateFCMTokenUseCase.updateFCMToken(token);
//   }
//
//   @override
//   void removeFCMTokenFromServer() async {
//     final token = _fcmToken;
//     if (token != null && AuthService.get.isLogedIn()) {
//       updateFCMTokenUseCase.deleteFCMToken(token);
//     }
//     _fcmToken = null;
//     FirebaseMessaging.instance.deleteToken();
//   }
//
//   void _routeToInvoiceDetail({required int invoiceId}) async {
//     if (!await SecureFeesAccessService.get.canAccessFeesTab()) {
//       return;
//     }
//
//     void _route() {
//       final tag = invoiceId.toString();
//       Get.toNamed(
//         AppPages.invoiceDetailPage.name,
//         arguments: {
//           'viewModel': InvoiceRowViewModel.fromInvoiceId(invoiceId),
//           'tag': tag
//         },
//       );
//     }
//
//     if (SettingsService.get.demoMode) {
//       Get.cupertinoDialog(
//         title: LocaleKeys.dialog_error_title.tr,
//         middleText:
//             LocaleKeys.dialog_error_demoContentUnavailable_description.tr,
//         textConfirm: LocaleKeys.button_ok.tr,
//         textCancel: LocaleKeys.button_cancel.tr,
//         onConfirm: () {
//           Get.back();
//           SettingsService.get.disableDemoMode();
//           _route();
//         },
//         onCancel: () => Get.back(),
//         barrierDismissible: false,
//       );
//     } else {
//       _route();
//     }
//   }
//
//   void _routeToPatientDetail({required int patientId, required int visitId}) {
//     void _route() {
//       final tag = Get.globalNavigator.toString() + (patientId.toString());
//       Get.toNamed(
//         AppPages.hospitalizedDetailPage.name,
//         arguments: {
//           'viewModel': HospitalizationRowViewModel.fromVisitIdAndPatientId(
//               visitId: visitId, patientId: patientId),
//           'tag': tag
//         },
//       );
//     }
//
//     if (SettingsService.get.demoMode) {
//       Get.cupertinoDialog(
//         title: LocaleKeys.dialog_error_title.tr,
//         middleText:
//             LocaleKeys.dialog_error_demoContentUnavailable_description.tr,
//         textConfirm: LocaleKeys.button_ok.tr,
//         textCancel: LocaleKeys.button_cancel.tr,
//         onConfirm: () {
//           Get.back();
//           SettingsService.get.disableDemoMode();
//           _route();
//         },
//         onCancel: () => Get.back(),
//         barrierDismissible: false,
//       );
//     } else {
//       _route();
//     }
//   }
//
//   void _onReceiveMessage(RemoteMessage remoteMessage) {
//     // When app is running.
//     if (!AuthService.get.isLogedIn()) {
//       return;
//     }
//
//     // Refresh notifications screen
//     NotificationsService.get.getNotifications(isLoadScreen: false);
//
//     final notification = parseNotificationUseCase.parseMap(remoteMessage.data);
//
//     if (notification == null) {
//       return;
//     }
//
//     _broadcastNotification(notification);
//
//     if (!_shouldShowNotificationBanner(notification)) {
//       return;
//     }
//
//     // Display notification banner if possible
//     _showRemoteMessageInLocalNotification(remoteMessage);
//   }
//
//   void _broadcastNotification(NotificationType notification) {
//     // Refresh home screen and hospitalized screen if notification type is Patient
//     if (notification is Patient) {
//       FBroadcast.instance().broadcast(BroadcastMessages.patientsTransferred,
//           value: notification);
//     }
//
//     if (notification is Invoice) {
//       FBroadcast.instance()
//           .broadcast(BroadcastMessages.invoiceUpdated, value: notification);
//     }
//   }
//
//   void _onReceiveMessageOpenedApp(RemoteMessage remoteMessage) {
//     // When use open app via clicking on notification banner in home screen.
//     _routeToMessageDestinationIfPossible(remoteMessage.data);
//   }
//
//   void _showRemoteMessageInLocalNotification(RemoteMessage remoteMessage) {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'doctor_base',
//       'Doctor Base',
//       channelDescription: 'Doctor Base Notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//
//     const IOSNotificationDetails iOSPlatformChannelSpecifics =
//         IOSNotificationDetails(
//       threadIdentifier: 'doctor_base',
//       presentAlert: true,
//       presentBadge: false,
//       presentSound: true,
//     );
//
//     const NotificationDetails platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSPlatformChannelSpecifics,
//     );
//
//     _flutterLocalNotificationsPlugin.show(
//       0,
//       remoteMessage.notification?.title,
//       remoteMessage.notification?.body,
//       platformChannelSpecifics,
//       payload: jsonEncode(remoteMessage.data),
//     );
//   }
//
//   void _onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) {
//     if (payload == null) {
//       return;
//     }
//
//     final data = jsonDecode(payload);
//     _routeToMessageDestinationIfPossible(data);
//   }
//
//   void _onSelectNotification(String? payload) {
//     if (payload == null) {
//       return;
//     }
//
//     final data = jsonDecode(payload);
//     _routeToMessageDestinationIfPossible(data);
//   }
//
//   void _showNotificationsDeniedDialog() {
//     final title = LocaleKeys.settings_notification_push.tr;
//     final content = Platform.isIOS
//         ? '${LocaleKeys.schedule_appointment_kind_group.tr}\n\n${LocaleKeys.dialog_permissions_notifications_iosSettings_description.tr}'
//         : '${LocaleKeys.schedule_appointment_kind_group.tr}\n\n${LocaleKeys.dialog_permissions_notifications_androidSettings_description.tr}';
//
//     Get.cupertinoDialog(
//       title: title,
//       middleText: content,
//       textCancel: LocaleKeys.button_cancel.tr,
//       textConfirm: LocaleKeys.dialog_open_settings.tr,
//       onConfirm: () {
//         Get.back();
//         AppSettings.openAppSettings();
//       },
//       barrierDismissible: false,
//     );
//   }
//
//   bool _shouldShowNotificationBanner(NotificationType notification) {
//     if (notification is Invoice &&
//         !SettingsService.get.feeStatusChangePushNotifications.value) {
//       return false;
//     }
//
//     if (notification is Patient &&
//         !SettingsService.get.sendPatientsPushNotifications.value) {
//       return false;
//     }
//
//     return true;
//   }
// }
