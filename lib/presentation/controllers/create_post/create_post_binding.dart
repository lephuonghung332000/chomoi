import 'package:chomoi/domain/usecases/category/fetch_category_use_case.dart';
import 'package:chomoi/presentation/controllers/create_post/create_post_controller.dart';
import 'package:get/get.dart';

class CreatePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreatePostController>(
      CreatePostController(
        fetchCategoryUseCase: FetchCategoryUseCase(),
      ),
    );
  }
}
