import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/search/search_repository_impl.dart';
import 'package:chomoi/domain/models/request/search/search_request_model.dart';
import 'package:chomoi/domain/repositories/search/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AddSearchUseCase extends ParamUseCase<
    Either<DioError, Unit>, SearchRequestModel> {
  late final SearchRepository _repo;

  AddSearchUseCase({SearchRepository? searchRepository}) {
    _repo = searchRepository ?? SearchRepositoryImpl();
  }

  @override
  Future<Either<DioError, Unit>> call(params) {
    return _repo.addSearch(params);
  }
}
