import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/chat/chat_repository_impl.dart';
import 'package:chomoi/domain/models/response/chat/chat_paging_model.dart';
import 'package:chomoi/domain/models/response/chat/message_chat_model.dart';
import 'package:chomoi/domain/models/response/chat/message_chat_paging_model.dart';
import 'package:chomoi/domain/repositories/chat/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchMessageChatUseCase extends ParamUseCase<
    Either<DioError, MessageChatPagingModel>, Tuple2<int?, String>> {
  late final ChatRepository _repo;

  FetchMessageChatUseCase({ChatRepository? chatRepository}) {
    _repo = chatRepository ?? ChatRepositoryImpl();
  }

  @override
  Future<Either<DioError, MessageChatPagingModel>> call(params) {
    return _repo.fetchMessageChat(
      page: params.value1,
      chatBoxId: params.value2,
    );
  }
}
