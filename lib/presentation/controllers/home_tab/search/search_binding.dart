import 'package:chomoi/domain/usecases/search/fetch_search_use_case.dart';
import 'package:chomoi/presentation/controllers/home_tab/search/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SearchController>(
      SearchController(
        fetchSearchUseCase: FetchSearchUseCase(),
      ),
    );
  }
}
