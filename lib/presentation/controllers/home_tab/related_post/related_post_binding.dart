import 'package:chomoi/domain/usecases/post/fetch_post_use_case.dart';
import 'package:chomoi/presentation/controllers/home_tab/related_post/related_post_controller.dart';
import 'package:get/get.dart';

class RelatedPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RelatedPostController>(
      RelatedPostController(
        fetchPostUseCase: FetchPostUseCase(),
      ),
    );
  }
}
