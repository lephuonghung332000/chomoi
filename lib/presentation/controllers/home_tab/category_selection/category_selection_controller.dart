import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/category/fetch_category_use_case.dart';
import 'package:get/get.dart';

class CategorySelectionController extends GetxController {
  final FetchCategoryUseCase fetchCategoryUseCase;

  CategorySelectionController({
    required this.fetchCategoryUseCase,
  });

  final _categoryState = const States<List<CategoryModel>>.init(
    entity: [],
  ).obs;

  States<List<CategoryModel>> get categoryState => _categoryState.value;

  @override
  void onReady() {
    _fetchCategory();
    super.onReady();
  }

  Future<void> _fetchCategory() async {
    _categoryState.value = const States.loading();
    final result = await fetchCategoryUseCase.call();
    result.fold((failure) {
      _categoryState.value = States.failure(failure);
    }, (value) {
      final categories = [
        CategoryModel(
          id: '',
          name: AppStrings.all_category_text,
          thumbnail: '',
          subThumbnail: AppAssets.iconAllCategory,
        )
      ];
      categories.addAll(value);
      _categoryState.value = States.success(entity: categories);
    });
  }
}
