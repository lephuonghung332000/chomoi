import 'package:chomoi/domain/usecases/brand/fetch_brand_use_case.dart';
import 'package:chomoi/domain/usecases/category/fetch_category_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_districts_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_provinces_use_case.dart';
import 'package:chomoi/domain/usecases/country/fetch_wards_use_case.dart';
import 'package:chomoi/domain/usecases/post/add_post_usecase.dart';
import 'package:chomoi/domain/usecases/user/fetch_user_use_case.dart';
import 'package:chomoi/presentation/controllers/create_post/create_post_controller.dart';
import 'package:get/get.dart';

class CreatePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreatePostController>(
      CreatePostController(
        fetchCategoryUseCase: FetchCategoryUseCase(),
        fetchBrandUseCase: FetchBrandUseCase(),
        fetchProvincesUseCase: FetchProvincesUseCase(),
        fetchDistrictsUseCase: FetchDistrictsUseCase(),
        fetchWardsUseCase: FetchWardsUseCase(),
        fetchUserUseCase: FetchUserUseCase(),
        addPostUseCase: AddPostUseCase(),
      ),
    );
  }
}
