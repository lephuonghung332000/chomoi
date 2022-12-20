import 'package:chomoi/data/dto/response/chat/message_chat_paging_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_chat_model.freezed.dart';

@freezed
class MessageChatModel with _$MessageChatModel {
  factory MessageChatModel({
    required String id,
    required String chatBoxId,
    required String content,
    required String sendBy,
    required String image,
    required double createAt,
  }) = _MessageChatModel;

  factory MessageChatModel.empty() => MessageChatModel(
        id: '',
        chatBoxId: '',
        content: '',
        sendBy: '',
        image: '',
        createAt: -1,
      );

  static List<MessageChatModel> fromDto(MessageChatPagingDto dto) {
    return List<MessageChatModel>.from(
      dto.data.map<MessageChatModel>(
        (e) => MessageChatModel(
          id: e.id,
          createAt: e.createAt,
          chatBoxId: e.chatBoxId,
          content: e.content,
          sendBy: e.sendBy,
          image: e.image,
        ),
      ),
    );
  }
}
