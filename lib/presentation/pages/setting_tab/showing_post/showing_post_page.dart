import 'package:cached_network_image/cached_network_image.dart';
import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/presentation/controllers/setting_tab/setting/setting_controller.dart';
import 'package:chomoi/presentation/controllers/setting_tab/showing_post/showing_post_controller.dart';
import 'package:chomoi/presentation/pages/home_tab/home/viewmodels/post_view_model.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/my_post_tab/my_post/my_post_list_view.dart';
import 'package:chomoi/presentation/widgets/my_post_tab/my_post/my_post_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowingPostPage extends GetView<ShowingPostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryContrastColor,
      appBar: CustomAppBar(
        title: AppStrings.is_being_selling_text,
        leading: AppBackButton(
          onBack: () => Navigator.of(context).pop(null),
        ),
      ),
      body: GetX<ShowingPostController>(builder: (controller) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 200),
          itemBuilder: (context, index) => MyPostRow(
            viewModel: PostViewModel.fromPost(controller.posts[index]),
            isShowFooter: false,
            postType: PostType.accept,
            isShowOption: false,
          ),
          itemCount: controller.posts.length,
        );
      }),
    );
  }
}
