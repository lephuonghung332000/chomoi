import 'package:chomoi/presentation/controllers/home/home_controller.dart';
import 'package:chomoi/presentation/controllers/login/login_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
    );
  }
}
