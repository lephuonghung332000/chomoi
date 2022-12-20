import 'package:chomoi/app/services/auth_service.dart';
import 'package:chomoi/app/util/get_extensions.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/domain/models/response/post/post_paging_model.dart';
import 'package:chomoi/domain/models/response/user/user_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/post/fetch_my_accept_post_usecase.dart';
import 'package:chomoi/domain/usecases/user/fetch_user_use_case.dart';
import 'package:chomoi/presentation/controllers/my_post_tab/my_post/my_post_controller.dart';
import 'package:chomoi/presentation/pages/setting_tab/setting/viewmodels/user_view_model.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  final FetchUserUseCase fetchUserUseCase;
  final FetchMyAcceptPostUseCase fetchMyAcceptPostUseCase;

  final _postAcceptState = States<PostPagingModel>.init(
    entity: PostPagingModel.empty(),
  ).obs;

  States<PostPagingModel> get postAcceptState => _postAcceptState.value;

  final _userState = States<UserModel>.init(
    entity: UserModel.empty(),
  ).obs;

  States<UserModel> get userState => _userState.value;

  SettingController({
    required this.fetchUserUseCase,
    required this.fetchMyAcceptPostUseCase,
  });

  Future<void> _fetchUser() async {
    // call info myself
    final userId = AuthService.get.getCurrentUserId();
    if (userId == null) {
      return;
    }
    _userState.value = const States.loading();
    final result = await fetchUserUseCase.call(userId);
    result.fold((failure) {
      _userState.value = States.failure(failure);
    }, (value) {
      _userState.value = States.success(entity: value);
    });
  }

  Future<void> _fetchAcceptPost() async {
    final userId = AuthService.get.getCurrentUserId();
    if (userId == null) {
      return;
    }
    _postAcceptState.value = const States.loading();
    final result = await fetchMyAcceptPostUseCase.call(userId);
    result.fold((failure) {
      _postAcceptState.value = States.failure(failure);
    }, (value) async {
      _postAcceptState.value = States.success(entity: value);
    });
  }

  void routePostDetail({required PostModel postModel}) {
    final tag = Get.globalNavigator.toString() + (postModel.id.toString());
    Get.toNamed(AppPages.postDetailPage.name, arguments: {
      'post': postModel,
      'tag': tag,
    });
  }

  @override
  void onInit() {
    _fetchUser();
    _fetchAcceptPost();
    super.onInit();
  }

  void routeAllMyPost(List<PostModel> posts) {
    Get.toNamed(AppPages.showingPostPage.name, arguments: {'posts': posts});
  }

  void routeEditUser(UserViewModel userViewModel) {
    Get.toNamed(AppPages.editUserPage.name, arguments: {'user': userViewModel})
        ?.then((value) {
      if (value) {
        _refreshScreens();
      }
    });
  }

  void _refreshScreens() {
    _fetchUser();
    if (Get.isRegistered<MyPostController>()) {
      Get.find<MyPostController>().fetchUser();
    }
  }

  void logout() {
    AuthService.get.logout();
  }
}
