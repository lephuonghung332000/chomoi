import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/controllers/my_post_tab/my_post/my_post_controller.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:chomoi/presentation/widgets/my_post_tab/my_post/my_post_list_view.dart';
import 'package:chomoi/presentation/widgets/my_post_tab/my_post/post_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

class MyPostPage extends GetView<MyPostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: CustomAppBar(
        title: AppStrings.manage_post_title,
        leading: const SizedBox(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: NotificationListener(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    _buildHeader(context),
                    _buildBody,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) => SliverPinnedHeader(
        child: Column(
          children: [_buildUserName(context), _buildTabbar],
        ),
      );

  Widget _buildUserName(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 0.5,
            ),
          ),
          color: AppColors.white,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Jay Jay',
              style: AppTextStyles.titleMediumBold17w700,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.blueSky),
                borderRadius: BorderRadius.circular(4),
              ),
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Text(
                  AppStrings.associate_e_wallet_title,
                  style: AppTextStyles.contentRegular15w400.copyWith(
                    color: AppColors.blueSky,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget get _buildTabbar => Material(
        color: AppColors.white,
        child: TabBar(
          controller: controller.tabController,
          indicatorColor: Get.theme.primaryColor,
          indicatorWeight: 3,
          labelStyle: AppTextStyles.infoBold13w700,
          unselectedLabelColor: AppColors.greyStorm,
          tabs: _tabs,
          isScrollable: true,
        ),
      );

  List<Widget> get _tabs => [
        GetX<MyPostController>(
          builder: (controller) {
            return PostTab(
              tabText: AppStrings.accept_post_title(
                controller.postAcceptState.maybeWhen(
                    orElse: () => 0, success: (value) => value.total),
              ),
            );
          },
        ),
        GetX<MyPostController>(
          builder: (controller) {
            return PostTab(
              tabText: AppStrings.pending_post_title(
                controller.postPendingState.maybeWhen(
                    orElse: () => 0, success: (value) => value.total),
              ),
            );
          },
        ),
        GetX<MyPostController>(
          builder: (controller) {
            return PostTab(
              tabText: AppStrings.reject_post_title(
                controller.postRejectState.maybeWhen(
                    orElse: () => 0, success: (value) => value.total),
              ),
            );
          },
        ),
      ];

  Widget get _buildBody => SliverFillRemaining(
        child: GetX<MyPostController>(
          builder: (controller) {
            return TabBarView(
              controller: controller.tabController,
              children: [
                _buildAcceptPost,
                _buildPendingPost,
                _buildRejectPost,
              ],
            );
          },
        ),
      );

  Widget get _buildAcceptPost => controller.postAcceptState.when(
        loading: () => const LoadingScreen(),
        success: (post) => MyPostListView(
          posts: post.posts,
          onTap: (post) {
            controller.routePostDetail(postModel: post);
          },
        ),
        failure: (exception) => const SizedBox.shrink(),
        init: (_) => const LoadingScreen(),
      );

  Widget get _buildPendingPost => controller.postPendingState.when(
        loading: () => const LoadingScreen(),
        success: (post) => MyPostListView(
          posts: post.posts,
          onTap: (post) {
            controller.routePostDetail(postModel: post);
          },
        ),
        failure: (exception) => const SizedBox.shrink(),
        init: (_) => const LoadingScreen(),
      );

  Widget get _buildRejectPost => controller.postRejectState.when(
        loading: () => const LoadingScreen(),
        success: (post) => MyPostListView(
          posts: post.posts,
          onTap: (post) {
            controller.routePostDetail(postModel: post);
          },
          isReject: true,
        ),
        failure: (exception) => const SizedBox.shrink(),
        init: (_) => const LoadingScreen(),
      );
}
