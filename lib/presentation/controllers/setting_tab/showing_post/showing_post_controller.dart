import 'package:chomoi/app/util/get_extensions.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:get/get.dart';

class ShowingPostController extends GetxController {
  ShowingPostController();

  final _posts = RxList<PostModel>();

  List<PostModel> get posts => _posts.toList();

  @override
  void onInit() {
    _initArguments();
    super.onInit();
  }

  void _initArguments() {
    // post
    if (Get.arguments != null) {
      if (Get.arguments['posts'] != null) {
        _posts.value = Get.arguments['posts'] as List<PostModel>;
      }
    }
  }

  void routePostDetail({required PostModel postModel}) {
    final tag = Get.globalNavigator.toString() + (postModel.id.toString());
    Get.toNamed(AppPages.postDetailPage.name, arguments: {
      'post': postModel,
      'tag': tag,
    });
  }
}
