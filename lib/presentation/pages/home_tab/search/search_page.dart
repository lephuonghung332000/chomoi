import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/presentation/controllers/home_tab/search/search_controller.dart';
import 'package:chomoi/presentation/widgets/ios_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Expanded(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              _buildHeader(),
            ],
          ),
        )
      ],
    ));
  }

  Widget _buildHeader() => SliverPinnedHeader(
        child: Container(
          color: AppColors.primaryColor,
          alignment: Alignment.bottomCenter,
          height: AppConstant.heightAppBarSearch,
          padding: const EdgeInsets.only(left: 6, right: 12, bottom: 2),
          child: IOSSearchBar(
            cancelButtonTitle: AppStrings.button_cancel,
            placeholder: AppStrings.search_hint_text,
            controller: controller.searchController,
            autofocus: true,
            onUpdate: (text) {
              controller.debounce.run(() {
              });
            },
            onActiveSearch: controller.onActiveSearch,
            onCancel: controller.onCancel,
          ),
        ),
      );
}
