import 'package:chomoi/domain/models/request/search/search_request_model.dart';
import 'package:chomoi/domain/models/response/search/search_history_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class SearchRepository {
  Future<Either<DioError, List<SearchHistoryModel>>> fetchSearch();

  Future<Either<DioError, Unit>> addSearch(
    SearchRequestModel searchRequestModel,
  );
}
