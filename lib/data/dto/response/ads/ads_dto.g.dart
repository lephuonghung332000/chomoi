// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsDto _$AdsDtoFromJson(Map<String, dynamic> json) => AdsDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => AdsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdsDtoToJson(AdsDto instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

AdsData _$AdsDataFromJson(Map<String, dynamic> json) => AdsData(
      id: json['id'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$AdsDataToJson(AdsData instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'content': instance.content,
      'url': instance.url,
    };
