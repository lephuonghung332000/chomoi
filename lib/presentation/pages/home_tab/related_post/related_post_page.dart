import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/presentation/controllers/home_tab/related_post/related_post_controller.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/home_tab/post/post_grid_view.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RelatedPostPage extends GetView<RelatedPostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: CustomAppBar(
        title: AppStrings.related_post_title,
        leading: AppBackButton(
          onBack: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: NotificationListener(
                onNotification: controller.onNotification,
                child: CustomScrollView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    _buildRelatedPost,
                    _buildLoadMorePost,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildRelatedPost =>
      GetX<RelatedPostController>(builder: (controller) {
        return controller.postState.when(
          loading: () => const SliverFillRemaining(
            hasScrollBody: false,
            child: LoadingScreen(),
          ),
          success: (entity) => SliverToBoxAdapter(
            child: PostGridView(
              posts: entity,
              onTap: (post) {
                controller.routePostDetail(postModel: post);
              },
            ),
          ),
          failure: (exception) =>
              const SliverToBoxAdapter(child: SizedBox.shrink()),
          init: (entity) => const SliverToBoxAdapter(child: SizedBox.shrink()),
        );
      });

  Widget get _buildLoadMorePost =>
      GetX<RelatedPostController>(builder: (controller) {
        return SliverToBoxAdapter(
          child: controller.isLoadingPost
              ? const LoadingScreen()
              : const SizedBox(),
        );
      });
}
