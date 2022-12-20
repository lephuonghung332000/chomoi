import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/chat/chat_repository_impl.dart';
import 'package:chomoi/domain/models/request/chat/chat_request_model.dart';
import 'package:chomoi/domain/models/response/chat/add_chat_model.dart';
import 'package:chomoi/domain/repositories/chat/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AddChatUseCase
    extends ParamUseCase<Either<DioError, AddChatModel>, ChatRequestModel> {
  late final ChatRepository _repo;

  AddChatUseCase({ChatRepository? chatRepository}) {
    _repo = chatRepository ?? ChatRepositoryImpl();
  }

  @override
  Future<Either<DioError, AddChatModel>> call(params) {
    return _repo.addChat(params);
  }
}
