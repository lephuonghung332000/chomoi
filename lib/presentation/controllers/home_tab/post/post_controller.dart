import 'package:chomoi/domain/models/request/search/search_request_model.dart';
import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:chomoi/domain/models/response/country/province_model.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/domain/models/response/user/user_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/post/fetch_post_use_case.dart';
import 'package:chomoi/domain/usecases/search/add_search_use_case.dart';
import 'package:chomoi/domain/usecases/user/fetch_user_use_case.dart';
import 'package:chomoi/presentation/controllers/home_tab/home_tab_navigator.dart';
import 'package:chomoi/presentation/controllers/main/main_controller.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final FetchPostUseCase fetchPostUseCase;
  final AddSearchUseCase addSearchUseCase;
  final FetchUserUseCase fetchUserUseCase;
  int _total = 0;

  PostController({
    required this.fetchPostUseCase,
    required this.addSearchUseCase,
    required this.fetchUserUseCase,
  });

  final _postState = const States<List<PostModel>>.init(
    entity: [],
  ).obs;

  States<List<PostModel>> get postState => _postState.value;

  final _isLoadingPost = false.obs;

  bool get isLoadingPost => _isLoadingPost.value;

  final _categoryName = ''.obs;

  String get categoryName => _categoryName.value;

  final _province = ''.obs;

  String get province => _province.value;

  final _search = ''.obs;

  String get search => _search.value;

  String _categoryId = '';

  final _isGrid = true.obs;

  bool get isGrid => _isGrid.value;

  final _timePost = 'DESC'.obs;

  String userId = '';

  String get timePost => _timePost.value;

  int _page = 1;

  final List<PostModel> _posts = [];

  Worker? _timePostListener;

  final searchController = TextEditingController();

  final _addSearchState = const States<Unit>.init(
    entity: unit,
  ).obs;

  States<Unit> get addSearchState => _addSearchState.value;

  final _userState = States<UserModel>.init(
    entity: UserModel.empty(),
  ).obs;

  States<UserModel> get userState => _userState.value;

  @override
  void onInit() {
    _initArguments();
    super.onInit();
  }

  Future<void> _initArguments() async {
    // categoryId
    if (Get.arguments != null) {
      if (Get.arguments['categoryId'] != null) {
        final category = Get.arguments['categoryId'] as CategoryModel;
        _categoryId = category.id;
        _categoryName.value = category.name;
      }

      if (Get.arguments['search'] != null) {
        final search = Get.arguments['search'] as String;
        _search.value = search;
        searchController.text = search;
        await _fetchUser();
        addSearch();
      }
    }
  }

  Future<void> _fetchUser() async {
    _userState.value = const States.loading();
    // call info myself
    final result = await fetchUserUseCase.call(null);
    result.fold((failure) {
      _userState.value = States.failure(failure);
    }, (value) {
      _userState.value = States.success(entity: value);
      userId = value.id;
    });
  }

  Future<void> addSearch() async {
    _addSearchState.value = const States.loading();
    final result = await addSearchUseCase.call(
      SearchRequestModel(
        userId: userId,
        key: _search.value,
      ),
    );
    result.fold((failure) {
      _addSearchState.value = States.failure(failure);
    }, (value) async {
      _addSearchState.value = States.success(entity: value);
    });
  }

  @override
  void onReady() {
    _initListeners();
    _fetchPost(
      categoryId: _categoryId,
      timePost: _timePost.value,
      province: _province.value,
      search: _search.value,
    );
    super.onReady();
  }

  @override
  void onClose() {
    _timePostListener?.dispose();
    searchController.dispose();
    super.onClose();
  }

  void togglePostView() {
    if (_isGrid.value) {
      _isGrid.value = false;
    } else {
      _isGrid.value = true;
    }
  }

  void routeToSearchPage() {
    MainController.homeNavigator
        ?.popAndPushNamed(HomeTabNavigatorRoutes.search);
  }

  void routeToCategorySelection() {
    Get.toNamed(AppPages.categorySelectionPage.name)?.then((value) {
      if (value is CategoryModel) {
        _categoryId = value.id.isNotEmpty ? value.id : '';
        _categoryName.value = value.name;
        _posts.clear();
        _fetchPost(
          categoryId: _categoryId,
          timePost: _timePost.value,
          province: _province.value,
          search: _search.value,
        );
      }
    });
  }

  void routeToProvinceSelection() {
    Get.toNamed(AppPages.provinceSelectionPage.name, arguments: {
      'province': _province.value,
    })?.then((value) {
      if (value is ProvinceModel) {
        _province.value = value.provinceId.isNotEmpty ? value.provinceName : '';
        _posts.clear();
        _fetchPost(
          categoryId: _categoryId,
          timePost: _timePost.value,
          province: _province.value,
          search: _search.value,
        );
      }
    });
  }

  void togglePostTimeView() {
    if (_timePost.value == 'ASC') {
      _timePost.value = 'DESC';
    } else {
      _timePost.value = 'ASC';
    }
  }

  void _initListeners() {
    _initPostTimeListener();
  }

  void _initPostTimeListener() {
    _timePostListener = ever<String>(_timePost, (value) {
      _posts.clear();
      _fetchPost(
        categoryId: _categoryId,
        timePost: _timePost.value,
        province: _province.value,
        search: _search.value,
      );
    });
  }

  bool onNotification(ScrollNotification notification) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      _fetchPost(
        page: _page + 1,
        categoryId: _categoryId,
        timePost: _timePost.value,
        province: _province.value,
        search: _search.value,
      );
    }

    return false;
  }

  Future<void> _fetchPost({
    String? timePost,
    String? categoryId,
    String? province,
    String? search,
    int page = 1,
  }) async {
    if (_total > 0 && _posts.length >= _total) {
      return;
    }

    if (isLoadingPost) {
      return;
    }

    _isLoadingPost.value = true;
    if (page == 1) {
      _postState.value = const States.loading();
    }
    final result = await fetchPostUseCase
        .call(Tuple5(timePost, categoryId, province, search, page));
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
}
