import 'package:json_annotation/json_annotation.dart';

part 'comment_paging_dto.g.dart';

@JsonSerializable()
class CommentPagingDto {
  CommentPagingDto({
    required this.success,
    required this.message,
    required this.total,
    required this.data,
  });

  final bool success;
  final String message;
  final int total;
  final List<CommentData> data;

  factory CommentPagingDto.fromJson(Map<String, dynamic> json) => _$CommentPagingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentPagingDtoToJson(this);
}

@JsonSerializable()
class CommentData {
  factory CommentData.fromJson(Map<String, dynamic> json) => _$CommentDataFromJson(json);

  CommentData({
    required this.id,
    required this.postId,
    required this.userId,
    required this.content,
    required this.createAt,
    required this.avatar,
    required this.fullname,
  });

  final String id;
  @JsonKey(name: 'post_id')
  final String postId;
  @JsonKey(name: 'user_id')
  final String userId;
  final String content;
  @JsonKey(name: 'create_at')
  final double createAt;
  final String avatar;
  final String fullname;

  Map<String, dynamic> toJson() => _$CommentDataToJson(this);
}
