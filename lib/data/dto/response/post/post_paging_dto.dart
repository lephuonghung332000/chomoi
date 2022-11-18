import 'package:json_annotation/json_annotation.dart';

part 'post_paging_dto.g.dart';

@JsonSerializable()
class PostPagingDto {
  PostPagingDto({
    required this.success,
    required this.message,
    required this.data,
    required this.total,
  });

  final bool success;
  final String message;
  final int total;
  final List<PostData> data;

  factory PostPagingDto.fromJson(Map<String, dynamic> json) =>
      _$PostPagingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostPagingDtoToJson(this);
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
    required this.dateJoin,
    required this.name,
    required this.phone,
    required this.email,
  });

  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'category_id')
  final String categoryId;
  final String title;
  @JsonKey(name: 'create_at')
  final double createAt;
  @JsonKey(name: 'update_at')
  final double updateAt;
  @JsonKey(name: 'brand_id')
  final String brandId;
  final String status;
  final List<String> images;
  final int price;
  final String description;
  final String address;
  final String avatar;
  @JsonKey(name: 'date_join')
  final double dateJoin;
  final String name;
  final String phone;
  final String email;

  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}
