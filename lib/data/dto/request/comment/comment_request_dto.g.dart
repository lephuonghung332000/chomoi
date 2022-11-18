// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRequestDto _$CommentRequestDtoFromJson(Map<String, dynamic> json) =>
    CommentRequestDto(
      content: json['content'] as String?,
      postId: json['post_id'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$CommentRequestDtoToJson(CommentRequestDto instance) =>
    <String, dynamic>{
      'content': instance.content,
      'post_id': instance.postId,
      'user_id': instance.userId,
    };
