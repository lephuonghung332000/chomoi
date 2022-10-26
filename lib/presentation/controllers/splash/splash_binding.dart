import 'package:chomoi/domain/usecases/auth/refresh_new_token_use_case.dart';
import 'package:chomoi/presentation/controllers/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
      SplashController(refreshNewTokenUseCase: RefreshNewTokenUseCase()),
    );
  }
}
