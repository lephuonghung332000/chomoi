import 'package:chomoi/domain/usecases/notification/update_read_notification_usecase.dart';
import 'package:chomoi/presentation/controllers/notification_tab/notification/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NotificationController>(
      NotificationController(
        updateReadNotificationUseCase: UpdateReadNotificationUseCase(),
      ),
    );
  }
}
