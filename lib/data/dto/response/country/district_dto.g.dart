// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictDto _$DistrictDtoFromJson(Map<String, dynamic> json) => DistrictDto(
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DistrictDtoToJson(DistrictDto instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      districtId: json['district_id'] as String,
      districtName: json['district_name'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'district_id': instance.districtId,
      'district_name': instance.districtName,
    };
