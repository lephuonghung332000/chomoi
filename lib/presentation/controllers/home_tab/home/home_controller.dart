import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/constant/app_url_constant.dart';
import 'package:chomoi/app/util/get_extensions.dart';
import 'package:chomoi/domain/models/response/ads/ads_model.dart';
import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/ads/fetch_ads_use_case.dart';
import 'package:chomoi/domain/usecases/category/fetch_category_use_case.dart';
import 'package:chomoi/domain/usecases/post/fetch_post_use_case.dart';
import 'package:chomoi/presentation/controllers/home_tab/home_tab_navigator.dart';
import 'package:chomoi/presentation/controllers/main/main_controller.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FetchAdsUseCase fetchAdsUseCase;
  final FetchCategoryUseCase fetchCategoryUseCase;
  final FetchPostUseCase fetchPostUseCase;

  HomeController({
    required this.fetchAdsUseCase,
    required this.fetchCategoryUseCase,
    required this.fetchPostUseCase,
  });

  final _adsState = const States<List<AdsModel>>.init(
    entity: [],
  ).obs;

  States<List<AdsModel>> get adsState => _adsState.value;

  final _categoryState = const States<List<CategoryModel>>.init(
    entity: [],
  ).obs;

  States<List<CategoryModel>> get categoryState => _categoryState.value;

  final _postState = const States<List<PostModel>>.init(
    entity: [],
  ).obs;

  States<List<PostModel>> get postState => _postState.value;

  final selectedBoxes = SelectedBox.values;

  final _isLoadingPost = false.obs;

  bool get isLoadingPost => _isLoadingPost.value;

  int _page = 1;

  int _total = 0;

  final List<PostModel> _posts = [];

  @override
  void onReady() {
    _fetchAds();
    _fetchCategory();
    _fetchPost();
    super.onReady();
  }

  bool onNotification(ScrollNotification notification) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      _fetchPost(page: _page + 1);
    }

    return false;
  }

  Future<void> _fetchAds() async {
    _adsState.value = const States.loading();
    final result = await fetchAdsUseCase.call();
    result.fold((failure) {
      _adsState.value = States.failure(failure);
    }, (value) {
      _adsState.value = States.success(entity: value);
    });
  }

  Future<void> _fetchCategory() async {
    _categoryState.value = const States.loading();
    final result = await fetchCategoryUseCase.call();
    result.fold((failure) {
      _categoryState.value = States.failure(failure);
    }, (value) {
      _categoryState.value = States.success(entity: value);
    });
  }

  Future<void> _fetchPost({int page = 1}) async {
    if (_total > 0 && _posts.length >= _total) {
      return;
    }

    if (_isLoadingPost.value) {
      return;
    }

    _isLoadingPost.value = true;
    if (page == 1) {
      _postState.value = const States.loading();
    }
    final result = await fetchPostUseCase.call(
      Tuple6(null, null, null, null, null, page),
    );
    result.fold((failure) {
      if (page == 1) {
        _postState.value = States.failure(failure);
      }
    }, (value) async {
      _page = page;
      _total = value.total;
      _posts.addAll(value.posts);
      _postState.value = States.success(entity: _posts);
      _postState.refresh();
    });
    _isLoadingPost.value = false;
  }

  void onTapSelectedBox(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      default:
        break;
    }
  }

  void routeToSearchPage({CategoryModel? category}) {
    MainController.homeNavigator?.pushNamed(HomeTabNavigatorRoutes.search);
  }

  void routeToPostPage({required CategoryModel category}) {
    MainController.homeNavigator
        ?.pushNamed(HomeTabNavigatorRoutes.post, arguments: {
      'categoryId': category,
    });
  }

  void routePostDetail({required PostModel postModel}) {
    final tag = Get.globalNavigator.toString() + (postModel.id.toString());
    Get.toNamed(AppPages.postDetailPage.name, arguments: {
      'post': postModel,
      'tag': tag,
    });
  }
}

enum SelectedBox {
  freeShip,
  rating,
  introduce,
  discount,
  savedPost,
  savedSearch,
}

extension SelectedBoxExt on SelectedBox {
  String get title {
    switch (this) {
      case SelectedBox.freeShip:
        return AppStrings.free_ship_text;
      case SelectedBox.rating:
        return AppStrings.rating_text;
      case SelectedBox.introduce:
        return AppStrings.introduce_text;
      case SelectedBox.discount:
        return AppStrings.discount_text;
      case SelectedBox.savedPost:
        return AppStrings.saved_post_text;
      case SelectedBox.savedSearch:
        return AppStrings.saved_search_text;
    }
  }

  String get iconLink {
    switch (this) {
      case SelectedBox.freeShip:
        return AppUrlConstant.iconFreeShip;
      case SelectedBox.rating:
        return AppUrlConstant.iconRating;
      case SelectedBox.introduce:
        return AppUrlConstant.iconIntroduce;
      case SelectedBox.discount:
        return AppUrlConstant.iconDiscount;
      case SelectedBox.savedPost:
        return AppUrlConstant.iconRating;
      case SelectedBox.savedSearch:
        return AppUrlConstant.iconSavedSearch;
    }
  }
}
