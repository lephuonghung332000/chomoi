// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_chat_paging_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageChatPagingDto _$MessageChatPagingDtoFromJson(
        Map<String, dynamic> json) =>
    MessageChatPagingDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      total: json['total'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => MessageChatData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageChatPagingDtoToJson(
        MessageChatPagingDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'total': instance.total,
      'data': instance.data,
    };

MessageChatData _$MessageChatDataFromJson(Map<String, dynamic> json) =>
    MessageChatData(
      id: json['id'] as String,
      content: json['id_receiver'] as String,
      chatBoxId: json['chat_box_id'] as String,
      sendBy: json['sendBy'] as String,
      image: json['image'] as String,
      createAt: (json['create_at'] as num).toDouble(),
    );

Map<String, dynamic> _$MessageChatDataToJson(MessageChatData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_receiver': instance.content,
      'chat_box_id': instance.chatBoxId,
      'sendBy': instance.sendBy,
      'image': instance.image,
      'create_at': instance.createAt,
    };
