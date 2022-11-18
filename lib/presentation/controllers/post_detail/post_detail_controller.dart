import 'package:chomoi/app/util/get_extensions.dart';
import 'package:chomoi/domain/models/response/comment/comment_model.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/domain/models/response/user/user_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/comment/fetch_comment_use_case.dart';
import 'package:chomoi/domain/usecases/contact/contact_phone_use_case.dart';
import 'package:chomoi/domain/usecases/contact/contact_sms_use_case.dart';
import 'package:chomoi/domain/usecases/post/fetch_post_use_case.dart';
import 'package:chomoi/domain/usecases/user/fetch_user_use_case.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController {
  final FetchUserUseCase fetchUserUseCase;
  final ContactPhoneUseCase contactPhoneUseCase;
  final ContactSmsUseCase contactSmsUseCase;
  final FetchPostUseCase fetchPostUseCase;
  final FetchCommentUseCase fetchCommentUseCase;

  PostDetailController({
    required this.fetchUserUseCase,
    required this.contactPhoneUseCase,
    required this.contactSmsUseCase,
    required this.fetchPostUseCase,
    required this.fetchCommentUseCase,
  });

  final _postDetail = PostModel.empty().obs;

  PostModel get postDetail => _postDetail.value;

  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  final _userState = States<UserModel>.init(
    entity: UserModel.empty(),
  ).obs;

  States<UserModel> get userState => _userState.value;

  final _postState = const States<List<PostModel>>.init(
    entity: [],
  ).obs;

  States<List<PostModel>> get postState => _postState.value;

  final _commentState = const States<List<CommentModel>>.init(
    entity: [],
  ).obs;

  States<List<CommentModel>> get commentState => _commentState.value;

  final _total = 0.obs;

  int get total => _total.value;

  @override
  void onInit() {
    _initArguments();
    super.onInit();
  }

  void setSelectedIndex(int index) {
    _selectedIndex.value = index;
  }

  void _initArguments() {
    // post
    if (Get.arguments != null) {
      if (Get.arguments['post'] != null) {
        _postDetail.value = Get.arguments['post'] as PostModel;
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
    });
  }

  void callPhone(String phoneNumber) {
    contactPhoneUseCase.call(phoneNumber);
  }

  void composeSms(String phoneNumber) {
    contactSmsUseCase.call(phoneNumber);
  }

  void routePostDetail({required PostModel postModel}) {
    final tag = Get.globalNavigator.toString() + postModel.id;
    Get.toNamed(AppPages.postDetailPage.name,
        arguments: {
          'post': postModel,
          'tag': tag,
        },
        preventDuplicates: false);
  }

  void routeAllComment() {
    Get.toNamed(
      AppPages.commentPage.name,
      arguments: {
        'post_id': _postDetail.value.id,
      },
    );
  }

  void routeRelatedPost() {
    Get.toNamed(
      AppPages.relatedPostPage.name,
      arguments: {
        'category_id': _postDetail.value.categoryId,
      },
    );
  }

  Future<void> _fetchPost({int page = 1}) async {
    _postState.value = const States.loading();

    final result = await fetchPostUseCase.call(
      Tuple6(null, null, _postDetail.value.categoryId, null, null, page),
    );
    result.fold((failure) {
      _postState.value = States.failure(failure);
    }, (value) async {
      final posts = value.posts.where((e) => e.id != postDetail.id).toList();
      _postState.value = States.success(entity: posts);
    });
  }

  Future<void> _fetchComment({int page = 1}) async {
    _commentState.value = const States.loading();

    final result = await fetchCommentUseCase.call(
      Tuple2(_postDetail.value.id, page),
    );
    result.fold((failure) {
      _commentState.value = States.failure(failure);
    }, (value) async {
      _total.value = value.total;
      _commentState.value = States.success(entity: value.comments);
    });
  }

  @override
  void onReady() {
    _fetchUser();
    _fetchPost();
    _fetchComment();
    super.onReady();
  }
}
