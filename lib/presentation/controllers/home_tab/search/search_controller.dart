import 'package:chomoi/app/util/debouncer.dart';
import 'package:chomoi/presentation/widgets/cupertino_sliver_navbar_with_large_trailing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final searchController = TextEditingController();
  final debounce = Debouncer(duration: const Duration(milliseconds: 300));

  final sliverNavBarController =
      CupertinoSliverNavigationBarWithLargeTrailingController();

  bool get isSearch => _isSearch.value;
  final _isSearch = false.obs;

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

  SearchController();
}
