import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_chat_local_model.freezed.dart';

@freezed
class MessageChatLocalModel with _$MessageChatLocalModel {
  factory MessageChatLocalModel({
    required String chatBoxId,
    required String content,
    required String sendBy,
    File? imageSend,
    String? imageReceive,
    required double createAt,
    required bool ownMessage,
  }) = _MessageChatLocalModel;

  factory MessageChatLocalModel.empty() => MessageChatLocalModel(
        chatBoxId: '',
        content: '',
        sendBy: '',
        imageSend: File(''),
        imageReceive: '',
        createAt: -1,
        ownMessage: false,
      );
}
