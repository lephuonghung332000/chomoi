// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandDto _$BrandDtoFromJson(Map<String, dynamic> json) => BrandDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => BrandData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BrandDtoToJson(BrandDto instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

BrandData _$BrandDataFromJson(Map<String, dynamic> json) => BrandData(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$BrandDataToJson(BrandData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
