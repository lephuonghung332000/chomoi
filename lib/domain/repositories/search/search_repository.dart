import 'package:chomoi/domain/models/response/search/search_history_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Exception, List<SearchHistoryModel>>> fetchSearch();
}
