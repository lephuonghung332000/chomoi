// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRequestDto _$PostRequestDtoFromJson(Map<String, dynamic> json) =>
    PostRequestDto(
      title: json['title'] as String?,
      brandId: json['brand_id'] as String?,
      address: json['address'] as String?,
      price: json['price'] as int?,
      categoryId: json['categoryId'] as String?,
      userId: json['user_id'] as String?,
      description: json['description'] as String?,
      file: (json['file'] as List<dynamic>)
          .map((e) => _$JsonConverterFromJson<MultipartFile, File?>(
              e, const FileListConverter().fromJson))
          .toList(),
    );

Map<String, dynamic> _$PostRequestDtoToJson(PostRequestDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'brand_id': instance.brandId,
      'address': instance.address,
      'price': instance.price,
      'categoryId': instance.categoryId,
      'description': instance.description,
      'user_id': instance.userId,
      'file': instance.file.map(const FileListConverter().toJson).toList(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
