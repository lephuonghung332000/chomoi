// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddChatDto _$AddChatDtoFromJson(Map<String, dynamic> json) => AddChatDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$AddChatDtoToJson(AddChatDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
