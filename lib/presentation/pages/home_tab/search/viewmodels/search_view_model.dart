import 'package:chomoi/domain/models/response/search/search_history_model.dart';

class SearchViewModel {
  final String? searchKey;

  SearchViewModel({
    this.searchKey,
  });
  String get key => searchKey ?? '';


  factory SearchViewModel.fromSearch(SearchHistoryModel model) {
    return SearchViewModel(
      searchKey: model.key,
    );
  }
}
