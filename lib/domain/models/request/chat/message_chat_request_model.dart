import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_chat_request_model.freezed.dart';

@freezed
class MessageChatRequestModel with _$MessageChatRequestModel {
  factory MessageChatRequestModel({
    required String chatBoxId,
    required String content,
    required String sendBy,
    MultipartFile? file,
    required bool ownMessage,
  }) = _MessageChatRequestModel;

  factory MessageChatRequestModel.empty() => MessageChatRequestModel(
        chatBoxId: '',
        content: '',
        sendBy: '',
    file: MultipartFile(Stream.fromIterable([]), 0),
        ownMessage: false,
      );
}
