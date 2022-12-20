// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRequestDto _$ChatRequestDtoFromJson(Map<String, dynamic> json) =>
    ChatRequestDto(
      idReceiver: json['id_receiver'] as String,
      postId: json['post_id'] as String,
      idSender: json['id_sender'] as String,
    );

Map<String, dynamic> _$ChatRequestDtoToJson(ChatRequestDto instance) =>
    <String, dynamic>{
      'id_receiver': instance.idReceiver,
      'post_id': instance.postId,
      'id_sender': instance.idSender,
    };
