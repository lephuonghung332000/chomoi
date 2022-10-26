// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ward_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WardDto _$WardDtoFromJson(Map<String, dynamic> json) => WardDto(
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WardDtoToJson(WardDto instance) => <String, dynamic>{
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      wardId: json['ward_id'] as String,
      wardName: json['ward_name'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'ward_id': instance.wardId,
      'ward_name': instance.wardName,
    };
