import 'package:chomoi/domain/usecases/post/fetch_post_use_case.dart';
import 'package:chomoi/presentation/controllers/home_tab/post/post_controller.dart';
import 'package:get/get.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PostController>(
      PostController(
        fetchPostUseCase: FetchPostUseCase(),
      ),
    );
  }
}
