import 'package:chomoi/app/util/get_extensions.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/post/fetch_post_use_case.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RelatedPostController extends GetxController {
  final FetchPostUseCase fetchPostUseCase;

  RelatedPostController({
    required this.fetchPostUseCase,
  });

  final _isLoadingPost = false.obs;

  bool get isLoadingPost => _isLoadingPost.value;

  int _page = 1;

  int _total = 0;

  String categoryId = '';

  final _postState = const States<List<PostModel>>.init(
    entity: [],
  ).obs;

  States<List<PostModel>> get postState => _postState.value;

  final List<PostModel> _posts = [];

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments['category_id'] != null) {
        categoryId = Get.arguments['category_id'] as String;
      }
    }

    super.onInit();
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
      Tuple6(null, null, categoryId, null, null, page),
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

  void routePostDetail({required PostModel postModel}) {
    final tag = Get.globalNavigator.toString() + (postModel.id.toString());
    Get.toNamed(AppPages.postDetailPage.name, arguments: {
      'post': postModel,
      'tag': tag,
    });
  }

  bool onNotification(ScrollNotification notification) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      _fetchPost(page: _page + 1);
    }

    return false;
  }

  @override
  void onReady() {
    _fetchPost();
    super.onReady();
  }
}
