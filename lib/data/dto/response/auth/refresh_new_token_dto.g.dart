// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_new_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshNewTokenDto _$RefreshNewTokenDtoFromJson(Map<String, dynamic> json) =>
    RefreshNewTokenDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$RefreshNewTokenDtoToJson(RefreshNewTokenDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
