import 'package:chomoi/presentation/controllers/post_tab/post_controller.dart';
import 'package:get/get.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PostController>(
      PostController(),
    );
  }
}
