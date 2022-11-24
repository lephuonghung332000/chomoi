import 'package:chomoi/domain/usecases/post/fetch_post_use_case.dart';
import 'package:chomoi/domain/usecases/search/add_search_use_case.dart';
import 'package:chomoi/domain/usecases/user/fetch_user_use_case.dart';
import 'package:chomoi/presentation/controllers/home_tab/post/post_controller.dart';
import 'package:get/get.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PostController>(
      PostController(
        fetchPostUseCase: FetchPostUseCase(),
        addSearchUseCase: AddSearchUseCase(),
        fetchUserUseCase: FetchUserUseCase(),
      ),
    );
  }
}
