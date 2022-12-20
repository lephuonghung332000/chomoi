// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_chat_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageChatRequestDto _$MessageChatRequestDtoFromJson(
        Map<String, dynamic> json) =>
    MessageChatRequestDto(
      chatBoxId: json['chat_box_id'] as String,
      content: json['content'] as String,
      sendBy: json['sendBy'] as String,
      file: _$JsonConverterFromJson<MultipartFile, MultipartFile>(
          json['file'], const FileConverterSerialize().fromJson),
      ownMessage: json['ownMessage'] as bool,
    );

Map<String, dynamic> _$MessageChatRequestDtoToJson(
        MessageChatRequestDto instance) =>
    <String, dynamic>{
      'chat_box_id': instance.chatBoxId,
      'content': instance.content,
      'sendBy': instance.sendBy,
      'file': _$JsonConverterToJson<MultipartFile, MultipartFile>(
          instance.file, const FileConverterSerialize().toJson),
      'ownMessage': instance.ownMessage,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
