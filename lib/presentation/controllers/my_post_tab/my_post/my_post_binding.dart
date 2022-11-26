import 'package:chomoi/domain/usecases/post/fetch_my_accept_post_usecase.dart';
import 'package:chomoi/domain/usecases/post/fetch_my_pending_post_usecase.dart';
import 'package:chomoi/domain/usecases/post/fetch_my_reject_post_usecase.dart';
import 'package:chomoi/domain/usecases/user/fetch_user_use_case.dart';
import 'package:chomoi/presentation/controllers/my_post_tab/my_post/my_post_controller.dart';
import 'package:get/get.dart';

class MyPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MyPostController>(
      MyPostController(
        fetchMyAcceptPostUseCase: FetchMyAcceptPostUseCase(),
        fetchMyPendingPostUseCase: FetchMyPendingPostUseCase(),
        fetchMyRejectPostUseCase: FetchMyRejectPostUseCase(),
        fetchUserUseCase: FetchUserUseCase(),
      ),
    );
  }
}
