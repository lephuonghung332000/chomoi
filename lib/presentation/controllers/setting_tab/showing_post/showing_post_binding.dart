import 'package:chomoi/domain/usecases/post/fetch_my_accept_post_usecase.dart';
import 'package:chomoi/domain/usecases/user/fetch_user_use_case.dart';
import 'package:chomoi/presentation/controllers/setting_tab/setting/setting_controller.dart';
import 'package:chomoi/presentation/controllers/setting_tab/showing_post/showing_post_controller.dart';
import 'package:get/get.dart';

class ShowingPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ShowingPostController>(
      ShowingPostController(
      ),
    );
  }
}
