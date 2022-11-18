import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/util/get_model_bottom_sheet.dart';
import 'package:chomoi/presentation/controllers/create_post/create_post_controller.dart';
import 'package:chomoi/presentation/controllers/home_tab/category_selection/category_selection_controller.dart';
import 'package:chomoi/presentation/pages/home_tab/category_selection/viewmodels/category_selection_view_model.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/category_list_view.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/hanlde_popover.dart';
import 'package:chomoi/presentation/widgets/home_tab/category_selection/category_row.dart';
import 'package:chomoi/presentation/widgets/input_field.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostPage extends GetView<CreatePostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryContrastColor,
      appBar: CustomAppBar(
        title: AppStrings.create_post_title,
        leading: AppBackButton(
          icon: const SvgIcon(
            icon: AppAssets.iconCancel,
          ),
          onBack: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: [
                  _buildForm(context),
                ],
              ),
            ),
            // _buildCommentBox
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) => SliverToBoxAdapter(
        child: Form(
          child: Column(
            children: [
              _buildCategorySelectField(context),
              _buildSeeMoreTitle,
              // _buildInputFamilyNameField(),
              // const VBox(15),
              // _buildInputNameField(),
              // const VBox(15),
              // _buildInputPhoneField(),
              // const VBox(15),
              // _buildInputGenderField(),
              // const VBox(15),
              // _buildInputBirthdayField(),
              // const VBox(15),
              // _buildInputProvinceField(),
              // const VBox(15),
              // _buildInputDistrictField(),
              // const VBox(15),
              // _buildInputWardField(),
              // const VBox(15),
              // _buildInputPasswordField(),
            ],
          ),
        ),
      );

  Widget _buildCategorySelectField(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: InputField(
          controller: controller.categoryController,
          readOnly: true,
          label: AppStrings.category_label_create_post_title,
          contentPadding: const EdgeInsets.all(12),
          suffixIcon: const SvgIcon(
            icon: AppAssets.iconArrowDown,
            size: 18,
            color: AppColors.greyStorm,
          ),
          onTap: () => _showCategoryBottomSheet(_buildCategoryList, context),
        ),
      );

  Future<void> _showCategoryBottomSheet(
      Widget categoryView, BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.modalBottomSheet(
      HandlePopover(
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.only(bottom: 30),
        boxShadow: kElevationToShadow[4],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10),
        ),
        height: heightBottomSheet(context),
        child: categoryView,
      ),
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.5),
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      isDismissible: false,
    );
  }

  Widget get _buildCategoryList => GetX<CreatePostController>(
        builder: (controller) {
          return controller.categoryState.when(
            loading: () => const Padding(
              padding: EdgeInsets.only(top: 10),
              child: LoadingScreen(),
            ),
            success: (categories) => CategoryListView(
              categories: categories,
              onTap: (category) =>
                  controller.setCategorySelection(category.name),
            ),
            failure: (exception) => const SizedBox.shrink(),
            init: (entity) => const Padding(
              padding: EdgeInsets.only(top: 10),
              child: LoadingScreen(),
            ),
          );
        },
      );

  Widget get _buildSeeMoreTitle => Container(
        color: AppColors.greyFog,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 4, left: 12),
              child: Text(
                '2',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4, bottom: 16, left: 12),
              child: Text('3'),
            ),
          ],
        ),
      );

  double heightBottomSheet(context) =>
      MediaQuery.of(context).size.height -
      (MediaQuery.of(context).padding.top) -
      kToolbarHeight;
}
