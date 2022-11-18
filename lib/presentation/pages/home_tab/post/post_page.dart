import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/controllers/home_tab/post/post_controller.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/home_tab/post/post_grid_view.dart';
import 'package:chomoi/presentation/widgets/home_tab/post/post_list_view.dart';
import 'package:chomoi/presentation/widgets/ios_search_bar.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

class PostPage extends GetView<PostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: NotificationListener(
              onNotification: controller.onNotification,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: [
                  _buildHeader(context),
                  _buildFilter,
                  _buildPost,
                  _buildSpace,
                  _buildLoadMorePost,
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget get _buildSpace => const SliverToBoxAdapter(
        child: VBox(15),
      );

  Widget _buildHeader(BuildContext context) => SliverPinnedHeader(
        child: Container(
          color: AppColors.primaryColor,
          alignment: Alignment.bottomCenter,
          height: AppConstant.heightAppBarSearch,
          padding: const EdgeInsets.only(left: 6, right: 12, bottom: 2),
          child: InkWell(
            onTap: () => controller.routeToSearchPage(),
            child: IOSSearchBar(
              alwaysShowCancelButton: true,
              height: AppConstant.heightAppBarSearch,
              controller: controller.searchController,
              placeholder: AppStrings.search_hint_text,
              enable: false,
              isShowChat: true,
            ),
          ),
        ),
      );

  Widget get _buildFilter => SliverPinnedHeader(
        child: Container(
          color: AppColors.primaryContrastColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IntrinsicWidth(
                    child: Row(
                      children: [
                        const SvgIcon(
                          icon: AppAssets.iconMap,
                          size: 16,
                        ),
                        const HBox(6),
                        Text(
                          AppStrings.area_text,
                          style: AppTextStyles.infoRegular13w400.copyWith(
                            color: AppColors.greyStorm,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const HBox(6),
                        Flexible(
                          child: GestureDetector(
                            onTap: () => controller.routeToProvinceSelection(),
                            child: GetX<PostController>(
                              builder: (controller) {
                                return Text(
                                  controller.province.isNotEmpty
                                      ? controller.province
                                      : AppStrings.all_area_text,
                                  style: AppTextStyles.contentRegular15w400,
                                  overflow: TextOverflow.ellipsis,
                                );
                              },
                            ),
                          ),
                        ),
                        const HBox(2),
                        const SvgIcon(
                          icon: AppAssets.iconArrowDown,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.togglePostView(),
                    child: GetX<PostController>(
                      builder: (controller) {
                        return SvgIcon(
                          icon: controller.isGrid
                              ? AppAssets.iconBulletList
                              : AppAssets.iconGridView,
                          size: 16,
                        );
                      },
                    ),
                  )
                ],
              ),
              const VBox(10),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyStorm),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.all(7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SvgIcon(
                          icon: AppAssets.iconFilter,
                          size: 16,
                        ),
                        HBox(3),
                        Text(
                          AppStrings.filter_text,
                          style: AppTextStyles.contentRegular15w400,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyStorm),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(7),
                      child: IntrinsicWidth(
                        child: Row(
                          children: [
                            Flexible(
                              child: GestureDetector(
                                onTap: () =>
                                    controller.routeToCategorySelection(),
                                child: GetX<PostController>(
                                  builder: (controller) {
                                    return Text(
                                      controller.categoryName.isNotEmpty
                                          ? controller.categoryName
                                          : AppStrings.all_category_text,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.contentRegular15w400,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const HBox(3),
                            const SvgIcon(
                              icon: AppAssets.iconArrowDown,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyStorm),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.all(7),
                    child: GestureDetector(
                      onTap: () => controller.togglePostTimeView(),
                      child: GetX<PostController>(
                        builder: (controller) {
                          return Text(
                            controller.timePost == 'ASC'
                                ? AppStrings.latest_post_text
                                : AppStrings.old_post_text,
                            style: AppTextStyles.contentRegular15w400,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget get _buildPost => GetX<PostController>(builder: (controller) {
        return SliverToBoxAdapter(
          child: controller.postState.when(
            loading: () => const SizedBox.shrink(),
            success: (entity) => Container(
              color: AppColors.white,
              child: controller.isGrid
                  ? PostGridView(
                      posts: entity,
                    )
                  : PostListView(
                      posts: entity,
                    ),
            ),
            failure: (exception) => const SizedBox.shrink(),
            init: (entity) => const SizedBox.shrink(),
          ),
        );
      });

  Widget get _buildLoadMorePost => GetX<PostController>(builder: (controller) {
        return SliverToBoxAdapter(
          child: controller.isLoadingPost
              ? const LoadingScreen()
              : const SizedBox(),
        );
      });
}
