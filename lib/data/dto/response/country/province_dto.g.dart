// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvinceDto _$ProvinceDtoFromJson(Map<String, dynamic> json) => ProvinceDto(
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProvinceDtoToJson(ProvinceDto instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      provinceId: json['province_id'] as String,
      provinceName: json['province_name'] as String,
      provinceType: json['province_type'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'province_id': instance.provinceId,
      'province_name': instance.provinceName,
      'province_type': instance.provinceType,
    };
