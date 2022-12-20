import 'package:json_annotation/json_annotation.dart';

part 'message_chat_paging_dto.g.dart';

@JsonSerializable()
class MessageChatPagingDto {
  MessageChatPagingDto({
    required this.success,
    required this.message,
    required this.total,
    required this.data,
  });

  final bool success;
  final String message;
  final int total;
  final List<MessageChatData> data;

  factory MessageChatPagingDto.fromJson(Map<String, dynamic> json) =>
      _$MessageChatPagingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MessageChatPagingDtoToJson(this);
}

@JsonSerializable()
class MessageChatData {
  factory MessageChatData.fromJson(Map<String, dynamic> json) =>
      _$MessageChatDataFromJson(json);

  MessageChatData({
    required this.id,
    required this.content,
    required this.chatBoxId,
    required this.sendBy,
    required this.image,
    required this.createAt,
  });

  final String id;
  @JsonKey(name: 'id_receiver')
  final String content;
  @JsonKey(name: 'chat_box_id')
  final String chatBoxId;
  final String sendBy;
  final String image;
  @JsonKey(name: 'create_at')
  final double createAt;

  Map<String, dynamic> toJson() => _$MessageChatDataToJson(this);
}
