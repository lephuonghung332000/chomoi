import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/search/search_repository_impl.dart';
import 'package:chomoi/domain/models/response/search/search_history_model.dart';
import 'package:chomoi/domain/repositories/search/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchSearchUseCase
    extends ParamUseCase<Either<DioError, List<SearchHistoryModel>>, String> {
  late final SearchRepository _repo;

  FetchSearchUseCase({SearchRepository? searchRepository}) {
    _repo = searchRepository ?? SearchRepositoryImpl();
  }

  @override
  Future<Either<DioError, List<SearchHistoryModel>>> call(params) {
    return _repo.fetchSearch(userId: params);
  }
}
