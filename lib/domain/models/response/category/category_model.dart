import 'package:chomoi/data/dto/response/category/category_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';

@freezed
class CategoryModel with _$CategoryModel {
  factory CategoryModel({
    required String id,
    required String name,
    required String thumbnail,
  }) = _CategoryModel;

  factory CategoryModel.empty() => CategoryModel(
        id: '',
        name: '',
        thumbnail: '',
      );

  static List<CategoryModel> fromDto(CategoryDto dto) {
    return List<CategoryModel>.from(
      dto.data.map<CategoryModel>(
        (e) => CategoryModel(
          id: e.id,
          name: e.name,
          thumbnail: e.thumbnail,
        ),
      ),
    );
  }
}
