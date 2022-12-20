import 'package:chomoi/app/util/file_converter_serialize.dart';
import 'package:chomoi/domain/models/request/chat/message_chat_request_model.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_chat_request_dto.g.dart';

@JsonSerializable()
class MessageChatRequestDto {
  @JsonKey(name: 'chat_box_id')
  final String chatBoxId;
  final String content;
  final String sendBy;
  @FileConverterSerialize()
  final MultipartFile? file;
  final bool ownMessage;

  MessageChatRequestDto({
    required this.chatBoxId,
    required this.content,
    required this.sendBy,
    required this.file,
    required this.ownMessage,
  });

  factory MessageChatRequestDto.fromJson(Map<String, dynamic> json) =>
      _$MessageChatRequestDtoFromJson(json);

  factory MessageChatRequestDto.fromModel(MessageChatRequestModel model) {
    return MessageChatRequestDto(
      chatBoxId: model.chatBoxId,
      content: model.content,
      sendBy: model.sendBy,
      file: model.file,
      ownMessage: model.ownMessage,
    );
  }

  Map<String, dynamic> toJson() => _$MessageChatRequestDtoToJson(this);
}
