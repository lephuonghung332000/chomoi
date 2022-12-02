import 'package:chomoi/domain/models/request/comment/comment_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_request_dto.g.dart';

@JsonSerializable()
class CommentRequestDto {
  final String content;
  @JsonKey(name: 'post_id')
  final String postId;
  @JsonKey(name: 'user_id')
  final String userId;

  CommentRequestDto({
    required this.content,
    required this.postId,
    required this.userId,
  });

  factory CommentRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CommentRequestDtoFromJson(json);

  factory CommentRequestDto.fromModel(CommentRequestModel model) {
    return CommentRequestDto(
      content: model.content,
      postId: model.postId,
      userId: model.userId,
    );
  }

  Map<String, dynamic> toJson() => _$CommentRequestDtoToJson(this);
}
