import 'package:chomoi/app/util/file_converter_serialize.dart';
import 'package:chomoi/domain/models/request/post/post_request_model.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_request_dto.g.dart';

@JsonSerializable()
class PostRequestDto {
  final String title;
  @JsonKey(name: 'brand_id')
  final String brandId;
  final String address;
  final int price;
  @JsonKey(name: 'category_id')
  final String categoryId;
  final String description;
  @JsonKey(name: 'user_id')
  final String userId;
  @FileConverterSerialize()
  final List<MultipartFile> files;

  PostRequestDto({
    required this.title,
    required this.brandId,
    required this.address,
    required this.price,
    required this.categoryId,
    required this.userId,
    required this.description,
    required this.files,
  });

  factory PostRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PostRequestDtoFromJson(json);

  factory PostRequestDto.fromModel(PostRequestModel model) {
    return PostRequestDto(
      userId: model.userId,
      title: model.title,
      brandId: model.brandId,
      address: model.address,
      price: model.price,
      categoryId: model.categoryId,
      description: model.description,
      files: model.files,
    );
  }

  Map<String, dynamic> toJson() => _$PostRequestDtoToJson(this);
}
