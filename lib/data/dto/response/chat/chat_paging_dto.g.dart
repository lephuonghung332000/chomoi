// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_paging_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatPagingDto _$ChatPagingDtoFromJson(Map<String, dynamic> json) =>
    ChatPagingDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      total: json['total'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => ChatData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatPagingDtoToJson(ChatPagingDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'total': instance.total,
      'data': instance.data,
    };

ChatData _$ChatDataFromJson(Map<String, dynamic> json) => ChatData(
      id: json['id'] as String,
      idReceiver: json['id_receiver'] as String,
      idSender: json['id_sender'] as String,
      createAt: (json['create_at'] as num).toDouble(),
      postId: json['post_id'] as String,
      postTitle: json['post_title'] as String,
      avatar: json['avatar'] as String,
      fullname: json['fullname'] as String,
      userId: json['user_id'] as String,
      postImage: json['post_image'] as String,
      postPrice: json['post_price'] as int,
    );

Map<String, dynamic> _$ChatDataToJson(ChatData instance) => <String, dynamic>{
      'id': instance.id,
      'id_receiver': instance.idReceiver,
      'id_sender': instance.idSender,
      'create_at': instance.createAt,
      'post_id': instance.postId,
      'post_title': instance.postTitle,
      'post_price': instance.postPrice,
      'post_image': instance.postImage,
      'avatar': instance.avatar,
      'fullname': instance.fullname,
      'user_id': instance.userId,
    };
