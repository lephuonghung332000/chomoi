import 'package:chomoi/app/services/app_lifecycle_service.dart';
import 'package:chomoi/app/services/auth_service.dart';
import 'package:chomoi/app/services/connectivity_service.dart';
import 'package:chomoi/app/services/firebase_message_service.dart';
import 'package:chomoi/app/services/local_storage_service.dart';
import 'package:chomoi/app/services/notification_service.dart';
import 'package:get/get.dart';

class DependencyCreator {
  static Future<void> init() async {
    /// init Service
    Get.put<FirebaseMessageService>(FirebaseMessageServiceImpl());
    await Get.putAsync(() => LocalStorageService().init());
    Get.put<ConnectivityService>(ConnectivityServiceImpl());
    Get.put<NotificationsService>(NotificationsServiceImpl());
    Get.put<AppLifecycleService>(AppLifecycleServiceImpl());
    await Get.putAsync<AuthService>(() => AuthServiceImpl().init());
  }
}
