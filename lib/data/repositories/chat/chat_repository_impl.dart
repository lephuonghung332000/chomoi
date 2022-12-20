import 'package:chomoi/data/dto/request/chat/chat_request_dto.dart';
import 'package:chomoi/data/dto/request/chat/message_chat_request_dto.dart';
import 'package:chomoi/data/dto/response/chat/add_chat_dto.dart';
import 'package:chomoi/data/dto/response/chat/chat_paging_dto.dart';
import 'package:chomoi/data/dto/response/chat/message_chat_paging_dto.dart';
import 'package:chomoi/data/providers/network/apis/chat_api.dart';
import 'package:chomoi/domain/models/request/chat/chat_request_model.dart';
import 'package:chomoi/domain/models/request/chat/message_chat_request_model.dart';
import 'package:chomoi/domain/models/response/chat/add_chat_model.dart';
import 'package:chomoi/domain/models/response/chat/chat_paging_model.dart';
import 'package:chomoi/domain/models/response/chat/message_chat_paging_model.dart';
import 'package:chomoi/domain/repositories/chat/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ChatRepositoryImpl extends ChatRepository {
  @override
  Future<Either<DioError, ChatPagingModel>> fetchChat({
    int? page,
    required String userId,
  }) =>
      Task(
        () => ChatApi.fetchChat(
          page: page,
          userId: userId,
        ).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (response) => ChatPagingModel.fromDto(
                ChatPagingDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<DioError, AddChatModel>> addChat(
          ChatRequestModel chatRequestModel) =>
      Task(
        () => ChatApi.addChat(
                chatRequestDto: ChatRequestDto.fromModel(chatRequestModel))
            .request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (response) => AddChatModel.fromDto(
                AddChatDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<DioError, Unit>> addMessageChat(
          MessageChatRequestModel messageChatRequestModel) =>
      Task(
        () => ChatApi.addMessageChat(
          messageChatRequestDto:
              MessageChatRequestDto.fromModel(messageChatRequestModel),
        ).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (response) => unit,
            ),
          )
          .run();

  @override
  Future<Either<DioError, MessageChatPagingModel>> fetchMessageChat(
          {int? page, required String chatBoxId}) =>
      Task(
        () => ChatApi.fetchMessageChat(
          page: page,
          chatBoxId: chatBoxId,
        ).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (response) => MessageChatPagingModel.fromDto(
                MessageChatPagingDto.fromJson(response),
              ),
            ),
          )
          .run();
}
