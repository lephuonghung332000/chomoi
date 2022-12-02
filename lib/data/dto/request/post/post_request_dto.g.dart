// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRequestDto _$PostRequestDtoFromJson(Map<String, dynamic> json) =>
    PostRequestDto(
      title: json['title'] as String,
      brandId: json['brand_id'] as String,
      address: json['address'] as String,
      price: json['price'] as int,
      categoryId: json['category_id'] as String,
      userId: json['user_id'] as String,
      description: json['description'] as String,
      files: (json['files'] as List<dynamic>)
          .map((e) =>
              const FileConverterSerialize().fromJson(e as MultipartFile))
          .toList(),
    );

Map<String, dynamic> _$PostRequestDtoToJson(PostRequestDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'brand_id': instance.brandId,
      'address': instance.address,
      'price': instance.price,
      'category_id': instance.categoryId,
      'description': instance.description,
      'user_id': instance.userId,
      'files':
          instance.files.map(const FileConverterSerialize().toJson).toList(),
    };
