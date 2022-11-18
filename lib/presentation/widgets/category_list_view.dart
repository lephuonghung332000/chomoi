import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:chomoi/presentation/pages/home_tab/category_selection/viewmodels/category_selection_view_model.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/home_tab/category_selection/category_row.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  final List<CategoryModel> categories;
  final Function(CategoryModel)? onTap;

  const CategoryListView({Key? key, required this.categories, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: CustomAppBar(
        title: AppStrings.category_selection_title,
        background: AppColors.secondaryBackgroundColor,
        leading: AppBackButton(
          icon: const SvgIcon(
            icon: AppAssets.iconCancel,
          ),
          onBack: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 200),
        itemBuilder: (context, index) => CategoryRow(
          viewModel: CategorySelectionViewModel.fromCategory(categories[index]),
          onTap: () {
            onTap?.call(categories[index]);
          },
        ),
        itemCount: categories.length,
      ),
    );
  }
}
