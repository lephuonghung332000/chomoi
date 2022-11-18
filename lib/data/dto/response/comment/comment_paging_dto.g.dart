// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_paging_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentPagingDto _$CommentPagingDtoFromJson(Map<String, dynamic> json) =>
    CommentPagingDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      total: json['total'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => CommentData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentPagingDtoToJson(CommentPagingDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'total': instance.total,
      'data': instance.data,
    };

CommentData _$CommentDataFromJson(Map<String, dynamic> json) => CommentData(
      id: json['id'] as String,
      postId: json['post_id'] as String,
      userId: json['user_id'] as String,
      content: json['content'] as String,
      createAt: (json['create_at'] as num).toDouble(),
      avatar: json['avatar'] as String,
      fullname: json['fullname'] as String,
    );

Map<String, dynamic> _$CommentDataToJson(CommentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'user_id': instance.userId,
      'content': instance.content,
      'create_at': instance.createAt,
      'avatar': instance.avatar,
      'fullname': instance.fullname,
    };
