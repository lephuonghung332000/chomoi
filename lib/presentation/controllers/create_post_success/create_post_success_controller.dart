import 'dart:io';

import 'package:chomoi/domain/models/request/post/post_request_model.dart';
import 'package:chomoi/presentation/controllers/main/main_controller.dart';
import 'package:chomoi/presentation/pages/main/main_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:get/get.dart';

class CreatePostSuccessController extends GetxController {
  CreatePostSuccessController();

  final _postRequestModel = PostRequestModel.empty().obs;

  PostRequestModel get postRequestModel => _postRequestModel.value;
  final _file = File('').obs;

  File get file => _file.value;

  @override
  void onInit() {
    _initArguments();
    super.onInit();
  }

  void _initArguments() {
    // post
    if (Get.arguments != null) {
      if (Get.arguments['post'] != null) {
        _postRequestModel.value = Get.arguments['post'] as PostRequestModel;
        _file.value = Get.arguments['image'] as File;
      }
    }
  }

  void routeToHome() {
    Get.back();
    Get.find<MainController>().navigateToPage(TabType.home);
  }

  void routeToMyPost() {
    Get.back();
    Get.find<MainController>().navigateToPage(TabType.my_post);
  }
}
