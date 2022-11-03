import 'package:json_annotation/json_annotation.dart';

part 'category_dto.g.dart';

@JsonSerializable()
class CategoryDto {
  CategoryDto({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final List<CategoryData> data;

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}

@JsonSerializable()
class CategoryData {
  factory CategoryData.fromJson(Map<String, dynamic> json) => _$CategoryDataFromJson(json);

  CategoryData({
    required this.id,
    required this.name,
    required this.thumbnail,
  });

  final String id;
  final String name;
  final String thumbnail;

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
