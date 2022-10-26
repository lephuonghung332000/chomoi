import 'package:chomoi/domain/usecases/auth/signup_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_districts_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_provinces_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_wards_use_case.dart';
import 'package:chomoi/presentation/controllers/sign_up/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(
      SignUpController(
        fetchProvincesUseCase: FetchProvincesUseCase(),
        fetchDistrictsUseCase: FetchDistrictsUseCase(),
        fetchWardsUseCase: FetchWardsUseCase(),
        signUpUseCase: SignUpUseCase(),
      ),
    );
  }
}
