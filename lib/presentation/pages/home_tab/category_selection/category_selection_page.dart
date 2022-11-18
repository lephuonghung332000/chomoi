import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/presentation/controllers/home_tab/category_selection/category_selection_controller.dart';
import 'package:chomoi/presentation/pages/home_tab/category_selection/viewmodels/category_selection_view_model.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/home_tab/category_selection/category_row.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorySelectionPage extends GetView<CategorySelectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryContrastColor,
      appBar: CustomAppBar(
        title: AppStrings.category_selection_title,
        leading: AppBackButton(
          icon: const SvgIcon(
            icon: AppAssets.iconCancel,
          ),
          onBack: () => Navigator.of(context).pop(null),
        ),
      ),
      body: GetX<CategorySelectionController>(builder: (controller) {
        return controller.categoryState.when(
          loading: () => const Padding(
            padding: EdgeInsets.only(top: 10),
            child: LoadingScreen(),
          ),
          success: (entity) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 200),
            itemBuilder: (context, index) => CategoryRow(
              viewModel: CategorySelectionViewModel.fromCategory(entity[index]),
              index: index,
              onTap: () => Navigator.of(context).pop(entity[index]),
            ),
            itemCount: entity.length,
          ),
          failure: (exception) => const SizedBox.shrink(),
          init: (entity) => const Padding(
            padding: EdgeInsets.only(top: 10),
            child: LoadingScreen(),
          ),
        );
      }),
    );
  }
}
