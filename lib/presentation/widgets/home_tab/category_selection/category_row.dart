import 'package:cached_network_image/cached_network_image.dart';
import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/presentation/pages/home_tab/category_selection/viewmodels/category_selection_view_model.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/ink_well_container.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class CategoryRow extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final int? index;
  final CategorySelectionViewModel viewModel;

  const CategoryRow({
    Key? key,
    this.onTap,
    this.index,
    required this.viewModel,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWellContainer(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.dividerColor,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (index != null && index == 0)
                  SvgIcon(
                    icon: viewModel.subThumbnail,
                    size: AppConstant.iconSize,
                  )
                else
                  CachedNetworkImage(
                    imageUrl: viewModel.subThumbnail,
                    width: AppConstant.iconSize,
                    height: AppConstant.iconSize,
                  ),
                const HBox(10),
                Text(viewModel.name)
              ],
            ),
            const SvgIcon(
              icon: AppAssets.iconArrowRight,
              size: 10,
              color: AppColors.greyStorm,
            )
          ],
        ),
      ),
    );
  }
}
