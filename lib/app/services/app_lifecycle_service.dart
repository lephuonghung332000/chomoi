import 'package:chomoi/app/services/notification_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class AppLifecycleService {
  static AppLifecycleService get get => Get.find<AppLifecycleService>();
}

class AppLifecycleServiceImpl extends GetxService
    with WidgetsBindingObserver
    implements AppLifecycleService {
  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);

    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);

    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        NotificationsService.get.refreshNotificationsTabIfPossible();
        break;

      case AppLifecycleState.inactive:
        break;

      case AppLifecycleState.paused:
        break;

      case AppLifecycleState.detached:
        break;
    }
  }
}
