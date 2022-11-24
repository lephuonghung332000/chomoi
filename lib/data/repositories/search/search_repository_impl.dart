import 'package:chomoi/data/dto/request/search/search_request_dto.dart';
import 'package:chomoi/data/dto/response/search/search_history_dto.dart';
import 'package:chomoi/data/providers/network/apis/search_api.dart';
import 'package:chomoi/domain/models/request/search/search_request_model.dart';
import 'package:chomoi/domain/models/response/search/search_history_model.dart';
import 'package:chomoi/domain/repositories/search/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl extends SearchRepository {
  @override
  Future<Either<Exception, List<SearchHistoryModel>>> fetchSearch() => Task(
        () => SearchApi.fetchSearch().request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (response) => SearchHistoryModel.fromDto(
                SearchHistoryDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<Exception, Unit>> addSearch(
          SearchRequestModel searchRequestModel) =>
      Task(
        () => SearchApi.addSearch(
            searchRequestDto: SearchRequestDto.fromModel(
          searchRequestModel,
        )).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (_) => unit,
            ),
          )
          .run();
}
