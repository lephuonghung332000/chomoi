import 'package:chomoi/data/dto/response/chat/message_chat_paging_dto.dart';
import 'package:chomoi/domain/models/response/chat/message_chat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_chat_paging_model.freezed.dart';

@freezed
class MessageChatPagingModel with _$MessageChatPagingModel {
  factory MessageChatPagingModel({
    required int total,
    required List<MessageChatModel> chats,
  }) = _MessageChatPagingModel;

  factory MessageChatPagingModel.empty() => MessageChatPagingModel(
        total: -1,
        chats: [],
      );

  factory MessageChatPagingModel.fromDto(MessageChatPagingDto dto) {
    return MessageChatPagingModel(
      chats: MessageChatModel.fromDto(
        dto,
      ),
      total: dto.total,
    );
  }
}
