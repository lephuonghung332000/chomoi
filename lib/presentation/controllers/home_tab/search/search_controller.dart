import 'package:chomoi/app/util/debouncer.dart';
import 'package:chomoi/domain/models/response/search/search_history_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/search/fetch_search_use_case.dart';
import 'package:chomoi/presentation/controllers/home_tab/home_tab_navigator.dart';
import 'package:chomoi/presentation/controllers/main/main_controller.dart';
import 'package:chomoi/presentation/widgets/cupertino_sliver_navbar_with_large_trailing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final FetchSearchUseCase fetchSearchUseCase;

  SearchController({
    required this.fetchSearchUseCase,
  });

  final searchController = TextEditingController();
  final debounce = Debouncer(duration: const Duration(milliseconds: 300));

  final _searchState = const States<List<SearchHistoryModel>>.init(
    entity: [],
  ).obs;

  States<List<SearchHistoryModel>> get searchState => _searchState.value;

  final sliverNavBarController =
      CupertinoSliverNavigationBarWithLargeTrailingController();

  bool get isSearch => _isSearch.value;
  final _isSearch = false.obs;

  @override
  void onReady() {

    _fetchSearch();
    super.onReady();
  }

  void onActiveSearch(bool isSearch) {
    _isSearch.value = isSearch;
    if (isSearch) {
      sliverNavBarController.collapse();
    } else {
      sliverNavBarController.unCollapse();
    }
  }

  void onCancel() {
    searchController.clear();
  }

  Future<void> _fetchSearch() async {
    _searchState.value = const States.loading();
    final result = await fetchSearchUseCase.call();
    result.fold((failure) {
      _searchState.value = States.failure(failure);
    }, (value) {
      _searchState.value = States.success(entity: value);
    });
  }

  void routeToPostPage({required String search}) {
    if (search.isEmpty) {
      return;
    }

    MainController.homeNavigator
        ?.popAndPushNamed(HomeTabNavigatorRoutes.post, arguments: {
      'search': search,
    });
  }
}
