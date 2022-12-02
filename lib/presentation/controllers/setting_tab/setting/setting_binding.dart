import 'package:chomoi/domain/usecases/post/fetch_my_accept_post_usecase.dart';
import 'package:chomoi/domain/usecases/user/fetch_user_use_case.dart';
import 'package:chomoi/presentation/controllers/setting_tab/setting/setting_controller.dart';
import 'package:get/get.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingController>(
      SettingController(
        fetchUserUseCase: FetchUserUseCase(),
        fetchMyAcceptPostUseCase: FetchMyAcceptPostUseCase(),
      ),
    );
  }
}
