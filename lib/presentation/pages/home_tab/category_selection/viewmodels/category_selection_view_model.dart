import 'package:chomoi/domain/models/response/category/category_model.dart';

class CategorySelectionViewModel {
  final String name;
  final String subThumbnail;

  CategorySelectionViewModel({
    required this.name,
    required this.subThumbnail,
  });

  factory CategorySelectionViewModel.fromCategory(CategoryModel categoryModel) {
    return CategorySelectionViewModel(
      name: categoryModel.name,
      subThumbnail: categoryModel.subThumbnail,
    );
  }
}
