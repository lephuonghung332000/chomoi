import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/controllers/home_tab/search/search_controller.dart';
import 'package:chomoi/presentation/pages/home_tab/search/viewmodels/search_view_model.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/home_tab/search/search_row.dart';
import 'package:chomoi/presentation/widgets/ios_search_bar.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: SafeArea(
          child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          _buildHeader,
          _buildSearchList(context),
        ],
      )),
    );
  }

  Widget get _buildHeader => SliverPinnedHeader(
        child: Container(
          color: AppColors.primaryColor,
          alignment: Alignment.bottomCenter,
          height: AppConstant.heightAppBarSearch,
          padding: const EdgeInsets.only(left: 6, right: 12, bottom: 2),
          child: IOSSearchBar(
            placeholder: AppStrings.search_hint_text,
            controller: controller.searchController,
            autofocus: true,
            onSubmit: (text){
              controller.debounce.run(() {
                controller.routeToPostPage(search: text);
              });
            },
            onActiveSearch: controller.onActiveSearch,
            onCancel: controller.onCancel,
          ),
        ),
      );

  Widget _buildLabel(BuildContext context) => SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 0.5,
              ),
            ),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SvgIcon(
                  icon: AppAssets.iconTimer,
                  size: 16,
                  color: AppColors.greyStorm,
                ),
                const HBox(15),
                Flexible(
                  child: Text(
                    AppStrings.search_recent_title,
                    style: AppTextStyles.infoRegular13w400.copyWith(
                      color: AppColors.greyStorm,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildSearchList(BuildContext context) =>
      GetX<SearchController>(builder: (controller) {
        return controller.searchState.when(
          loading: () => const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: LoadingScreen(),
            ),
          ),
          success: (entity) => MultiSliver(children: [
            _buildLabel(context),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return SearchRow(
                    viewModel: SearchViewModel.fromSearch(
                      entity[index],
                    ),
                    onTap: () =>
                        controller.routeToPostPage(search: entity[index].key),
                  );
                },
                childCount: entity.length,
              ),
            )
          ]),
          failure: (exception) => const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          ),
          init: (entity) => const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: LoadingScreen(),
            ),
          ),
        );
      });
}
