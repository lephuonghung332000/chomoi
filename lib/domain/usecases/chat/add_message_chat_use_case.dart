import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/chat/chat_repository_impl.dart';
import 'package:chomoi/domain/models/request/chat/chat_request_model.dart';
import 'package:chomoi/domain/models/request/chat/message_chat_request_model.dart';
import 'package:chomoi/domain/models/response/chat/add_chat_model.dart';
import 'package:chomoi/domain/repositories/chat/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AddMessageChatUseCase
    extends ParamUseCase<Either<DioError, Unit>, MessageChatRequestModel> {
  late final ChatRepository _repo;

  AddMessageChatUseCase({ChatRepository? chatRepository}) {
    _repo = chatRepository ?? ChatRepositoryImpl();
  }

  @override
  Future<Either<DioError, Unit>> call(params) {
    return _repo.addMessageChat(params);
  }
}
