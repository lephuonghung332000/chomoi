import 'package:chomoi/domain/usecases/category/fetch_category_use_case.dart';
import 'package:chomoi/presentation/controllers/home_tab/category_selection/category_selection_controller.dart';
import 'package:get/get.dart';

class CategorySelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CategorySelectionController>(
      CategorySelectionController(
        fetchCategoryUseCase: FetchCategoryUseCase(),
      ),
    );
  }
}
