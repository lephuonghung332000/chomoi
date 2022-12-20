import 'package:chomoi/domain/usecases/ads/fetch_ads_use_case.dart';
import 'package:chomoi/domain/usecases/category/fetch_category_use_case.dart';
import 'package:chomoi/domain/usecases/post/fetch_post_use_case.dart';
import 'package:chomoi/domain/usecases/user/fetch_user_use_case.dart';
import 'package:chomoi/presentation/controllers/home_tab/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        fetchAdsUseCase: FetchAdsUseCase(),
        fetchCategoryUseCase: FetchCategoryUseCase(),
        fetchPostUseCase: FetchPostUseCase(),
        fetchUserUseCase: FetchUserUseCase(),
      ),
    );
  }
}
