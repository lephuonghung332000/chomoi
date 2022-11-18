import 'package:chomoi/domain/usecases/category/fetch_category_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_provinces_use_case.dart';
import 'package:get/get.dart';

import 'province_selection_controller.dart';

class ProvinceSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProvinceSelectionController>(
      ProvinceSelectionController(
        fetchProvincesUseCase: FetchProvincesUseCase(),
      ),
    );
  }
}
