import 'package:json_annotation/json_annotation.dart';

part 'chat_paging_dto.g.dart';

@JsonSerializable()
class ChatPagingDto {
  ChatPagingDto({
    required this.success,
    required this.message,
    required this.total,
    required this.data,
  });

  final bool success;
  final String message;
  final int total;
  final List<ChatData> data;

  factory ChatPagingDto.fromJson(Map<String, dynamic> json) => _$ChatPagingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChatPagingDtoToJson(this);
}

@JsonSerializable()
class ChatData {
  factory ChatData.fromJson(Map<String, dynamic> json) => _$ChatDataFromJson(json);

  ChatData({
    required this.id,
    required this.idReceiver,
    required this.idSender,
    required this.createAt,
    required this.postId,
    required this.postTitle,
    required this.avatar,
    required this.fullname,
    required this.userId,
    required this.postImage,
    required this.postPrice,
  });

  final String id;
  @JsonKey(name: 'id_receiver')
  final String idReceiver;
  @JsonKey(name: 'id_sender')
  final String idSender;
  @JsonKey(name: 'create_at')
  final double createAt;
  @JsonKey(name: 'post_id')
  final String postId;
  @JsonKey(name: 'post_title')
  final String postTitle;
  @JsonKey(name: 'post_price')
  final int postPrice;
  @JsonKey(name: 'post_image')
  final String postImage;
  final String avatar;
  @JsonKey(name: 'fullname')
  final String fullname;
  @JsonKey(name: 'user_id')
  final String userId;

  Map<String, dynamic> toJson() => _$ChatDataToJson(this);
}
