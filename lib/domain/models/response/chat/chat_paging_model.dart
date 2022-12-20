import 'package:chomoi/data/dto/response/chat/chat_paging_dto.dart';
import 'package:chomoi/domain/models/response/chat/chat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_paging_model.freezed.dart';

@freezed
class ChatPagingModel with _$ChatPagingModel {
  factory ChatPagingModel({
    required int total,
    required List<ChatModel> chats,
  }) = _ChatPagingModel;

  factory ChatPagingModel.empty() => ChatPagingModel(
    total: -1,
    chats: [],
  );

  factory ChatPagingModel.fromDto(ChatPagingDto dto) {
    return ChatPagingModel(
      chats: ChatModel.fromDto(
        dto,
      ),
      total: dto.total,
    );
  }
}