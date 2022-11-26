import 'package:chomoi/presentation/controllers/create_post_success/create_post_success_controller.dart';
import 'package:get/get.dart';

class CreatePostSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreatePostSuccessController>(
      CreatePostSuccessController(),
    );
  }
}
