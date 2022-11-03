import 'package:json_annotation/json_annotation.dart';

part 'post_dto.g.dart';

@JsonSerializable()
class PostDto {
  PostDto({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final List<PostData> data;

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostDtoToJson(this);
}

@JsonSerializable()
class PostData {
  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);

  PostData({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.title,
    required this.createAt,
    required this.updateAt,
    required this.brandId,
    required this.status,
    required this.images,
    required this.price,
    required this.description,
    required this.address,
    required this.avatar,
  });

  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'category_id')
  final String categoryId;
  final String title;
  @JsonKey(name: 'create_at')
  final int createAt;
  @JsonKey(name: 'update_at')
  final int updateAt;
  @JsonKey(name: 'brand_id')
  final String brandId;
  final String status;
  final List<String> images;
  final int price;
  final String description;
  final String address;
  final String avatar;

  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}
