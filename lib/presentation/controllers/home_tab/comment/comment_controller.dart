import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/util/get_cupertino_dialog.dart';
import 'package:chomoi/domain/models/request/comment/comment_request_model.dart';
import 'package:chomoi/domain/models/response/comment/comment_model.dart';
import 'package:chomoi/domain/models/response/user/user_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/comment/add_comment_use_case.dart';
import 'package:chomoi/domain/usecases/comment/fetch_comment_use_case.dart';
import 'package:chomoi/domain/usecases/user/fetch_user_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  final FetchCommentUseCase fetchCommentUseCase;
  final AddCommentUseCase addCommentUseCase;
  final FetchUserUseCase fetchUserUseCase;
  final commentController = TextEditingController();

  CommentController({
    required this.fetchCommentUseCase,
    required this.addCommentUseCase,
    required this.fetchUserUseCase,
  });

  final _commentState = const States<List<CommentModel>>.init(
    entity: [],
  ).obs;

  States<List<CommentModel>> get commentState => _commentState.value;

  int _total = 0;

  String postId = '';

  String userId = '';

  final _isLoadingComment = false.obs;

  bool get isLoadingComment => _isLoadingComment.value;

  final _isEmptyComment = true.obs;

  bool get isEmptyComment => _isEmptyComment.value;

  int _page = 1;

  final List<CommentModel> _comments = [];

  final _addCommentState = const States<Unit>.init(
    entity: unit,
  ).obs;

  States<Unit> get addCommentState => _addCommentState.value;

  final _userState = States<UserModel>.init(
    entity: UserModel.empty(),
  ).obs;

  States<UserModel> get userState => _userState.value;

  final _isAddNewComment = false.obs;

  bool get isAddNewComment => _isAddNewComment.value;

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments['post_id'] != null) {
        postId = Get.arguments['post_id'] as String;
      }
    }

    super.onInit();
  }

  bool onNotification(ScrollNotification notification) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      _fetchComment(page: _page + 1);
    }

    return false;
  }

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    _fetchUser();
    _fetchComment();
    super.onReady();
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

  Future<void> _fetchComment({int page = 1}) async {
    if (_total > 0 && _comments.length >= _total) {
      return;
    }

    if (_isLoadingComment.value) {
      return;
    }

    _isLoadingComment.value = true;
    if (page == 1) {
      _commentState.value = const States.loading();
    }

    final result = await fetchCommentUseCase.call(
      Tuple2(postId, page),
    );
    result.fold((failure) {
      if (page == 1) {
        _commentState.value = States.failure(failure);
      }
    }, (value) async {
      _page = page;
      _total = value.total;
      _comments.addAll(value.comments);
      _commentState.value = States.success(entity: _comments);
      _commentState.refresh();
    });
    _isLoadingComment.value = false;
  }

  Future<void> addComment() async {
    if (commentController.text.isEmpty) {
      return;
    }

    FocusManager.instance.primaryFocus?.unfocus();
    _addCommentState.value = const States.loading();
    final result = await addCommentUseCase.call(
      CommentRequestModel(
        userId: userId,
        content: commentController.text,
        postId: postId,
      ),
    );
    result.fold((failure) {
      _addCommentState.value = States.failure(failure);
      Get.cupertinoDialog(
        title: AppStrings.error_title,
        middleText: failure.toString(),
        onConfirm: () => Get.back(),
        barrierDismissible: false,
      );
    }, (value) async {
      _addCommentState.value = States.success(entity: value);
      _comments.clear();
      _fetchComment();
      commentController.clear();
      _isAddNewComment.value = true;
    });
  }

  void onChange(String value) {
    _isEmptyComment.value = value.isEmpty;
    commentController.text = value;
    commentController.selection = TextSelection.fromPosition(
      TextPosition(offset: commentController.text.length),
    );
  }
}
