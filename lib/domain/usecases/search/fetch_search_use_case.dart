import 'package:chomoi/app/core/usecases/no_param_usecase.dart';
import 'package:chomoi/data/repositories/search/search_repository_impl.dart';
import 'package:chomoi/domain/models/response/search/search_history_model.dart';
import 'package:chomoi/domain/repositories/search/search_repository.dart';
import 'package:dartz/dartz.dart';

class FetchSearchUseCase
    extends NoParamUseCase<Either<Exception, List<SearchHistoryModel>>> {
  late final SearchRepository _repo;

  FetchSearchUseCase({SearchRepository? searchRepository}) {
    _repo = searchRepository ?? SearchRepositoryImpl();
  }

  @override
  Future<Either<Exception, List<SearchHistoryModel>>> call() {
    return _repo.fetchSearch();
  }
}
