// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHistoryDto _$SearchHistoryDtoFromJson(Map<String, dynamic> json) =>
    SearchHistoryDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => SearchHistoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchHistoryDtoToJson(SearchHistoryDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

SearchHistoryData _$SearchHistoryDataFromJson(Map<String, dynamic> json) =>
    SearchHistoryData(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      key: json['key'] as String,
      createAt: (json['create_at'] as num).toDouble(),
    );

Map<String, dynamic> _$SearchHistoryDataToJson(SearchHistoryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'create_at': instance.createAt,
      'key': instance.key,
    };
