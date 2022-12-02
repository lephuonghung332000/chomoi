// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unread_notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnreadNotificationDto _$UnreadNotificationDtoFromJson(
        Map<String, dynamic> json) =>
    UnreadNotificationDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as int,
    );

Map<String, dynamic> _$UnreadNotificationDtoToJson(
        UnreadNotificationDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
