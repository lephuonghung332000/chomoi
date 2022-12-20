import 'package:chomoi/domain/models/request/chat/chat_request_model.dart';
import 'package:chomoi/domain/models/request/comment/comment_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_request_dto.g.dart';

@JsonSerializable()
class ChatRequestDto {
  @JsonKey(name: 'id_receiver')
  final String idReceiver;
  @JsonKey(name: 'post_id')
  final String postId;
  @JsonKey(name: 'id_sender')
  final String idSender;

  ChatRequestDto({
    required this.idReceiver,
    required this.postId,
    required this.idSender,
  });

  factory ChatRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ChatRequestDtoFromJson(json);

  factory ChatRequestDto.fromModel(ChatRequestModel model) {
    return ChatRequestDto(
      idReceiver: model.idReceiver,
      postId: model.postId,
      idSender: model.idSender,
    );
  }

  Map<String, dynamic> toJson() => _$ChatRequestDtoToJson(this);
}
