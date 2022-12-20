import 'package:chomoi/data/dto/response/chat/chat_paging_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';

@freezed
class ChatModel with _$ChatModel {
  factory ChatModel({
    required String id,
    required String idReceiver,
    required String idSender,
    required double createAt,
    required String postId,
    required String avatar,
    required String postTitle,
    required String fullname,
    required String userId,
    required String postImage,
    required int postPrice,
  }) = _ChatModel;

  factory ChatModel.empty() => ChatModel(
        id: '',
        idReceiver: '',
        idSender: '',
        createAt: -1,
        postId: '',
        avatar: '',
        postTitle: '',
        fullname: '',
        userId: '',
        postImage: '',
        postPrice: -1,
      );

  static List<ChatModel> fromDto(ChatPagingDto dto) {
    return List<ChatModel>.from(
      dto.data.map<ChatModel>(
        (e) => ChatModel(
          id: e.id,
          idReceiver: e.idReceiver,
          idSender: e.idSender,
          createAt: e.createAt,
          postId: e.postId,
          avatar: e.avatar,
          postTitle: e.postTitle,
          fullname: e.fullname,
          userId: e.userId,
          postImage: e.postImage,
          postPrice: e.postPrice,
        ),
      ),
    );
  }
}
