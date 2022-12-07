// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_paging_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationPagingDto _$NotificationPagingDtoFromJson(
        Map<String, dynamic> json) =>
    NotificationPagingDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      total: json['total'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => NotificationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationPagingDtoToJson(
        NotificationPagingDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'total': instance.total,
      'data': instance.data,
    };

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      content: json['content'] as String,
      createAt: (json['create_at'] as num).toDouble(),
      title: json['title'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      isNew: json['isNew'] as bool,
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'content': instance.content,
      'create_at': instance.createAt,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'title': instance.title,
      'isNew': instance.isNew,
      'isRead': instance.isRead,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.post_pending: 'post pending',
  NotificationType.post_accept: 'post accept',
  NotificationType.post_reject: 'post reject',
  NotificationType.ads: 'ads',
};
