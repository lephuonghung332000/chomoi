import 'package:chomoi/domain/usecases/country/fetch_districts_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_provinces_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_wards_use_case.dart';
import 'package:chomoi/domain/usecases/user/update_user_usecase.dart';
import 'package:chomoi/presentation/controllers/setting_tab/edit_user/edit_user_controller.dart';
import 'package:get/get.dart';

class EditUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EditUserController>(
      EditUserController(
        fetchProvincesUseCase: FetchProvincesUseCase(),
        fetchDistrictsUseCase: FetchDistrictsUseCase(),
        fetchWardsUseCase: FetchWardsUseCase(),
        updateUserUseCase: UpdateUserUseCase(),
      ),
    );
  }
}
