import 'package:chomoi/app/util/get_extensions.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/domain/models/response/post/post_paging_model.dart';
import 'package:chomoi/domain/models/response/user/user_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/post/fetch_my_accept_post_usecase.dart';
import 'package:chomoi/domain/usecases/post/fetch_my_pending_post_usecase.dart';
import 'package:chomoi/domain/usecases/post/fetch_my_reject_post_usecase.dart';
import 'package:chomoi/domain/usecases/user/fetch_user_use_case.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPostController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final FetchMyAcceptPostUseCase fetchMyAcceptPostUseCase;
  final FetchMyPendingPostUseCase fetchMyPendingPostUseCase;
  final FetchMyRejectPostUseCase fetchMyRejectPostUseCase;
  final FetchUserUseCase fetchUserUseCase;

  final _postAcceptState = States<PostPagingModel>.init(
    entity: PostPagingModel.empty(),
  ).obs;

  States<PostPagingModel> get postAcceptState => _postAcceptState.value;

  final _postPendingState = States<PostPagingModel>.init(
    entity: PostPagingModel.empty(),
  ).obs;

  States<PostPagingModel> get postPendingState => _postPendingState.value;

  final _postRejectState = States<PostPagingModel>.init(
    entity: PostPagingModel.empty(),
  ).obs;

  States<PostPagingModel> get postRejectState => _postRejectState.value;

  final _userState = States<UserModel>.init(
    entity: UserModel.empty(),
  ).obs;

  States<UserModel> get userState => _userState.value;

  MyPostController({
    required this.fetchMyAcceptPostUseCase,
    required this.fetchMyPendingPostUseCase,
    required this.fetchMyRejectPostUseCase,
    required this.fetchUserUseCase,
  });

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    _fetchRejectPost();
    _fetchAcceptPost();
    _fetchPendingPost();
    fetchUser();
  }

  Future<void> fetchUser() async {
    _userState.value = const States.loading();
    // call info myself
    final result = await fetchUserUseCase.call(null);
    result.fold((failure) {
      _userState.value = States.failure(failure);
    }, (value) {
      _userState.value = States.success(entity: value);
    });
  }

  Future<void> _fetchAcceptPost() async {
    _postAcceptState.value = const States.loading();

    final result = await fetchMyAcceptPostUseCase.call();
    result.fold((failure) {
      _postAcceptState.value = States.failure(failure);
    }, (value) async {
      _postAcceptState.value = States.success(entity: value);
    });
  }

  Future<void> _fetchPendingPost() async {
    _postPendingState.value = const States.loading();

    final result = await fetchMyPendingPostUseCase.call();
    result.fold((failure) {
      _postPendingState.value = States.failure(failure);
    }, (value) async {
      _postPendingState.value = States.success(entity: value);
    });
  }

  Future<void> _fetchRejectPost() async {
    _postRejectState.value = const States.loading();

    final result = await fetchMyRejectPostUseCase.call();
    result.fold((failure) {
      _postRejectState.value = States.failure(failure);
    }, (value) async {
      _postRejectState.value = States.success(entity: value);
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
