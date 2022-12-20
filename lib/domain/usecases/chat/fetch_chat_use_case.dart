import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/chat/chat_repository_impl.dart';
import 'package:chomoi/domain/models/response/chat/chat_paging_model.dart';
import 'package:chomoi/domain/repositories/chat/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchChatUseCase extends ParamUseCase<Either<DioError, ChatPagingModel>,
    Tuple2<int?, String>> {
  late final ChatRepository _repo;

  FetchChatUseCase({ChatRepository? chatRepository}) {
    _repo = chatRepository ?? ChatRepositoryImpl();
  }

  @override
  Future<Either<DioError, ChatPagingModel>> call(params) {
    return _repo.fetchChat(
      page: params.value1,
      userId: params.value2,
    );
  }
}
