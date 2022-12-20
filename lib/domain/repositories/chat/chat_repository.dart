import 'package:chomoi/domain/models/request/chat/chat_request_model.dart';
import 'package:chomoi/domain/models/request/chat/message_chat_request_model.dart';
import 'package:chomoi/domain/models/response/chat/add_chat_model.dart';
import 'package:chomoi/domain/models/response/chat/chat_paging_model.dart';
import 'package:chomoi/domain/models/response/chat/message_chat_paging_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class ChatRepository {
  Future<Either<DioError, ChatPagingModel>> fetchChat({
    int? page,
    required String userId,
  });

  Future<Either<DioError, AddChatModel>> addChat(
    ChatRequestModel chatRequestModel,
  );

  Future<Either<DioError, Unit>> addMessageChat(
    MessageChatRequestModel messageChatRequestModel,
  );

  Future<Either<DioError, MessageChatPagingModel>> fetchMessageChat({
    int? page,
    required String chatBoxId,
  });
}
