import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/controllers/home_tab/home/home_controller.dart';
import 'package:chomoi/presentation/pages/home_tab/home/viewmodels/post_view_model.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/home/category_grid_view.dart';
import 'package:chomoi/presentation/widgets/home/home_carousel.dart';
import 'package:chomoi/presentation/widgets/home/post_grid_view.dart';
import 'package:chomoi/presentation/widgets/home/post_vertical_box.dart';
import 'package:chomoi/presentation/widgets/home/utility_box.dart';
import 'package:chomoi/presentation/widgets/ios_search_bar.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomePage extends GetView<HomeController> {
  static const double itemSpacing = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                _buildHeader,
                _buildCarousel,
                _buildUtility,
                _buildSpace,
                _buildCategory,
                _buildSpace,
                _buildLatestProduct
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget get _buildSpace => const SliverToBoxAdapter(
        child: VBox(15),
      );

  Widget get _buildHeader => SliverPinnedHeader(
        child: Container(
          color: AppColors.primaryColor,
          alignment: Alignment.bottomCenter,
          height: AppConstant.heightAppBarSearch,
          padding: const EdgeInsets.only(left: 6, right: 12, bottom: 2),
          child: InkWell(
            onTap: () => Get.toNamed(
              AppPages.searchPage.name,
            ),
            child: const IOSSearchBar(
              height: AppConstant.heightAppBarSearch,
              cancelButtonTitle: AppStrings.button_cancel,
              placeholder: AppStrings.search_hint_text,
              enable: false,
              isShowChat: true,
            ),
          ),
        ),
      );

  Widget get _buildCarousel => GetX<HomeController>(
        builder: (controller) {
          return SliverToBoxAdapter(
            child: controller.adsState.when(
              loading: () => const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: LoadingScreen(),
              ),
              success: (entity) => HomeCarousel(
                ads: entity.map((e) => e).toList(),
              ),
              failure: (exception) => const HomeCarousel(
                ads: [],
              ),
              init: (entity) => const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: LoadingScreen(),
              ),
            ),
          );
        },
      );

  Widget get _buildUtility => SliverToBoxAdapter(
        child: Container(
          height: 120,
          color: AppColors.white,
          child: CupertinoScrollbar(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: itemSpacing),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final e = controller.selectedBoxes[index];
                return UtilityBox(
                  onPress: () => controller.onTapSelectedBox(e.index),
                  selectBox: e,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const HBox(itemSpacing),
              itemCount: controller.selectedBoxes.length,
            ),
          ),
        ),
      );

  Widget get _buildCategory => GetX<HomeController>(builder: (controller) {
        return SliverToBoxAdapter(
          child: controller.categoryState.when(
            loading: () => const LoadingScreen(),
            success: (entity) => Container(
              color: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      AppStrings.category_title,
                      style: AppTextStyles.contentBold15w700,
                    ),
                  ),
                  const VBox(10),
                  Container(
                    height: AppConstant.heightCategoryView,
                    child: CategoryGridView(
                      categories: entity,
                    ),
                  )
                ],
              ),
            ),
            failure: (exception) => const SizedBox.shrink(),
            init: (entity) => const LoadingScreen(),
          ),
        );
      });

  Widget get _buildLatestProduct => GetX<HomeController>(builder: (controller) {
        return SliverToBoxAdapter(
          child: controller.postState.when(
            loading: () => const LoadingScreen(),
            success: (entity) => Container(
              color: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      AppStrings.latest_post_title,
                      style: AppTextStyles.contentBold15w700,
                    ),
                  ),
                  const VBox(10),
                  PostGridView(
                    posts: entity,
                  )
                ],
              ),
            ),
            failure: (exception) => const SizedBox.shrink(),
            init: (entity) => const LoadingScreen(),
          ),
        );
      });
}
