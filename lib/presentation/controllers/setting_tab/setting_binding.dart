import 'package:chomoi/presentation/controllers/setting_tab/setting_controller.dart';
import 'package:get/get.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingController>(
      SettingController(),
    );
  }
}
