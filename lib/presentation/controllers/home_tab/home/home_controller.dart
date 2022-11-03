import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/constant/app_url_constant.dart';
import 'package:chomoi/domain/models/response/ads/ads_model.dart';
import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/domain/models/response/user/user_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/ads/fetch_ads_use_case.dart';
import 'package:chomoi/domain/usecases/category/fetch_category_use_case.dart';
import 'package:chomoi/domain/usecases/post/fetch_post_use_case.dart';
import 'package:dartz/dartz.dart';
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

  final _userState = const States<List<UserModel>>.init(
    entity: [],
  ).obs;

  States<List<UserModel>> get userState => _userState.value;

  final selectedBoxes = SelectedBox.values;

  @override
  void onReady() {
    super.onReady();
    _fetchAds();
    _fetchCategory();
    _fetchPost();
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

  Future<void> _fetchPost({String? status, int? page}) async {
    _postState.value = const States.loading();
    final result = await fetchPostUseCase.call(Tuple2(status, page));
    result.fold((failure) {
      _postState.value = States.failure(failure);
    }, (value) async {
      _postState.value = States.success(entity: value);
    });
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
