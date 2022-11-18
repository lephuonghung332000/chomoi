import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:chomoi/domain/models/response/country/province_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/country/fetch_provinces_use_case.dart';
import 'package:get/get.dart';

class ProvinceSelectionController extends GetxController {
  final FetchProvincesUseCase fetchProvincesUseCase;

  ProvinceSelectionController({
    required this.fetchProvincesUseCase,
  });

  final _provinceState = const States<List<ProvinceModel>>.init(
    entity: [],
  ).obs;

  States<List<ProvinceModel>> get provinceState => _provinceState.value;

  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  String selectedProvince = '';

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments['province'] != null) {
        selectedProvince = Get.arguments['province'] as String;
      }
    }
    super.onInit();
  }

  void onChangeSelection(int index) {
    _selectedIndex.value = index;
  }

  @override
  void onReady() {
    _getProvinces();
    super.onReady();
  }

  Future<void> _getProvinces() async {
    _provinceState.value = const States.loading();
    final result = await fetchProvincesUseCase.call();
    result.fold((failure) {
      _provinceState.value = States.failure(failure);
    }, (value) {
      final provinces = [
        ProvinceModel(
          provinceId: '',
          provinceName: AppStrings.all_area_text,
          provinceType: '',
        )
      ];
      provinces.addAll(value);
      _provinceState.value = States.success(entity: provinces);
      initSelectedIndex(provinces);
    });
  }

  void initSelectedIndex(List<ProvinceModel> provinces) {
    if (selectedProvince.isNotEmpty) {
      _selectedIndex.value = provinces.indexWhere(
          (element) => element.provinceName.compareTo(selectedProvince) == 0);
    }
  }
}
