import 'package:chomoi/presentation/controllers/notification_tab/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NotificationController>(
      NotificationController(),
    );
  }
}
