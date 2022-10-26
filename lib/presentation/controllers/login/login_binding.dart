import 'package:chomoi/domain/usecases/auth/login_use_case.dart';
import 'package:chomoi/presentation/controllers/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(loginUseCase: LoginUseCase()),
    );
  }
}
