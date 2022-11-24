import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/constant/app_url_constant.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/app/config/themes/cupertino_theme.dart';
import 'package:chomoi/app/util/get_model_bottom_sheet.dart';
import 'package:chomoi/app/util/url_launcher.dart';
import 'package:chomoi/presentation/controllers/create_post/create_post_controller.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/category_list_view.dart';
import 'package:chomoi/presentation/widgets/create_post/brand_view.dart';
import 'package:chomoi/presentation/widgets/create_post/select_address_view.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/custom_button.dart';
import 'package:chomoi/presentation/widgets/hanlde_popover.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/input_field.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
        child: Form(
          key: controller.createPostFormKey,
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    _buildCategorySelectField(context),
                    _buildSeeMoreTitle,
                    _buildPickImageView(context),
                    _buildBrandSelectField(context),
                    _buildPriceInputField,
                    _buildTitleAndDescription,
                    _buildTitleAndDescriptionField,
                    _buildAboutUser,
                    _buildAddressSelectField(context)
                  ],
                ),
              ),
              _buildButtonFooter
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPickImageView(BuildContext context) => SliverToBoxAdapter(
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 450),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: GetX<CreatePostController>(
              builder: (controller) {
                return controller.imageFiles.isNotEmpty
                    ? _buildImagesView
                    : _buildAddImage(context);
              },
            )),
      );

  Widget _buildAddImage(BuildContext context) => GestureDetector(
        onTap: () => showCupertinoModalPopup<void>(
          context: context,
          builder: (context) => _buildOptionSelectImage,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, bottom: 10, top: 10),
          child: DottedBorder(
            color: AppColors.primaryColor,
            strokeWidth: 1,
            dashPattern: const [3, 2],
            child: Container(
              width: double.infinity,
              color: AppColors.greyFog,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: SvgIcon(
                      size: AppConstant.iconCameraSize,
                      icon: AppAssets.iconCamera,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      AppStrings.post_at_least_one_photo_text,
                      style: AppTextStyles.commandBold9w700.copyWith(
                        color: AppColors.greyStorm,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget get _buildImagesView => Container(
        height: AppConstant.itemImageBox,
        alignment: Alignment.centerLeft,
        child: GetX<CreatePostController>(
          builder: (controller) {
            return ListView(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                buildAddImageSmall,
                ..._buildSelectedImages,
              ],
            );
          },
        ),
      );

  List<Widget> get _buildSelectedImages => controller.imageFiles
      .map(
        (e) => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.file(
                  e,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => controller.removeImage(e),
                child: const SvgIcon(
                  icon: AppAssets.iconCancelCircle,
                ),
              ),
            ),
          ],
        ),
      )
      .toList();

  Widget get _buildOptionSelectImage => CupertinoTheme(
        data: defaultCupertinoTheme,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CupertinoActionSheet(
            actions: <Widget>[
              Material(
                color: AppColors.white,
                child: InkWell(
                  onTap: () {},
                  child: CupertinoActionSheetAction(
                    onPressed: () => controller.selectImagesFromCamera(),
                    child: Text(
                      AppStrings.pick_image_camera,
                      style: AppTextStyles.titleMediumBold17w700
                          .copyWith(color: AppColors.blueSky),
                    ),
                  ),
                ),
              ),
              Material(
                color: AppColors.white,
                child: InkWell(
                  onTap: () {},
                  child: CupertinoActionSheetAction(
                    onPressed: () => controller.selectImagesFromGallery(),
                    child: Text(
                      AppStrings.pick_image_gallery,
                      style: AppTextStyles.titleMediumBold17w700
                          .copyWith(color: AppColors.blueSky),
                    ),
                  ),
                ),
              ),
            ],
            cancelButton: Material(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
              child: InkWell(
                onTap: () {},
                child: CupertinoActionSheetAction(
                  isDestructiveAction: true,
                  isDefaultAction: true,
                  child: Text(
                    AppStrings.cancel,
                    style: AppTextStyles.titleMediumBold17w700.copyWith(
                      color: AppColors.errorColor,
                    ),
                  ),
                  onPressed: () => Get.back(),
                ),
              ),
            ),
          ),
        ),
      );

  Widget get buildAddImageSmall => AspectRatio(
        aspectRatio: 1,
        child: Container(
          color: AppColors.greyFog,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: SvgIcon(
                      size: AppConstant.iconSize,
                      icon: AppAssets.iconCamera,
                    ),
                  ),
                  HBox(5),
                  SvgIcon(
                    size: AppConstant.iconCameraAddSize,
                    icon: AppAssets.iconCameraAdd,
                  ),
                ],
              ),
              Text(
                AppStrings.add_photo_text,
                style: AppTextStyles.commandBold9w700.copyWith(
                  color: AppColors.greyStorm,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildCategorySelectField(BuildContext context) => SliverToBoxAdapter(
        child: Padding(
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
            onTap: () => _showBottomSheet(_buildCategoryList, context),
          ),
        ),
      );

  Widget _buildBrandSelectField(BuildContext context) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          child: InputField(
            controller: controller.brandController,
            readOnly: true,
            label: AppStrings.brand_create_post_title,
            contentPadding: const EdgeInsets.all(12),
            suffixIcon: const SvgIcon(
              icon: AppAssets.iconArrowDown,
              size: 18,
              color: AppColors.greyStorm,
            ),
            onTap: () => _showBottomSheet(_buildBrandView, context),
          ),
        ),
      );

  Widget get _buildPriceInputField => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 18),
          child: InputField(
            controller: controller.priceController,
            label: AppStrings.price_create_post_title,
            keyboardType: TextInputType.number,
            contentPadding: const EdgeInsets.all(12),
            inputFormatters: [controller.formatter],
            onChanged: (text) => controller.formatInputPrice(text),
          ),
        ),
      );

  Widget get _buildTitleAndDescriptionField => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          child: Column(
            children: [
              InputField(
                controller: controller.titleController,
                label: AppStrings.title_field_create_post_title,
                contentPadding: const EdgeInsets.all(12),
              ),
              const VBox(18),
              InputField(
                controller: controller.descriptionController,
                label: AppStrings.description_field_create_post_title,
                contentPadding: const EdgeInsets.all(12),
                maxLength: AppConstant.descriptionMaxLength,
                keyboardType: TextInputType.multiline,
                maxLine: 10,
              ),
            ],
          ),
        ),
      );

  Future<void> _showBottomSheet(Widget widget, BuildContext context) async {
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
        child: widget,
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

  Widget get _buildBrandView => GetX<CreatePostController>(
        builder: (controller) {
          return controller.brandState.when(
            loading: () => const Padding(
              padding: EdgeInsets.only(top: 10),
              child: LoadingScreen(),
            ),
            success: (brands) => BrandView(
              brands: brands,
              onTap: (brand) => controller.setBrandSelection(brand),
              selectedBrand: controller.selectedBrand,
            ),
            failure: (exception) => const SizedBox.shrink(),
            init: (entity) => const Padding(
              padding: EdgeInsets.only(top: 10),
              child: LoadingScreen(),
            ),
          );
        },
      );

  Widget get _buildSeeMoreTitle => SliverToBoxAdapter(
        child: Container(
          color: AppColors.greyFog,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 4, left: 12),
                child: Text(
                  AppStrings.create_post_info_text,
                  style: AppTextStyles.infoRegular13w400.copyWith(
                    color: AppColors.greyStorm,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 16, left: 12),
                child: RichText(
                  maxLines: 5,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: AppStrings.see_more_about_text,
                        style: AppTextStyles.infoRegular13w400,
                      ),
                      TextSpan(
                        text: AppStrings.create_post_rule_text,
                        style: AppTextStyles.infoRegular13w400.copyWith(
                          color: AppColors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => UrlLauncher.openUrl(
                              AppUrlConstant.createPostTermPage),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget get _buildTitleAndDescription => SliverToBoxAdapter(
        child: Container(
          color: AppColors.greyFog,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 6, left: 12),
            child: Text(
              AppStrings.create_post_title_and_description_text,
              style: AppTextStyles.infoRegular13w400.copyWith(
                color: AppColors.greyStorm,
              ),
            ),
          ),
        ),
      );

  Widget _buildAddressSelectField(BuildContext context) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          child: InputField(
            controller: controller.addressController,
            readOnly: true,
            label: AppStrings.address_label_create_post_title,
            contentPadding: const EdgeInsets.all(12),
            onTap: () => _showBottomSheet(
              SelectAddressView(
                address: controller.addressController.text,
                height: heightBottomSheet(context),
                onSubmit: (address) =>controller.setAddressSelection(address),
              ),
              context,
            ),
          ),
        ),
      );

  Widget get _buildAboutUser => SliverToBoxAdapter(
        child: Container(
          color: AppColors.greyFog,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 6, left: 12),
            child: Text(
              AppStrings.user_create_post_title,
              style: AppTextStyles.infoRegular13w400.copyWith(
                color: AppColors.greyStorm,
              ),
            ),
          ),
        ),
      );

  Widget get _buildButtonFooter => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 10,
              child: CustomButton(
                title: AppStrings.see_previous_create_post_title,
                fontWeight: FontWeight.w700,
                style: CustomButtonStyle.empty,
                showBorder: true,
                fontSize: 13,
                height: 35,
                onPressed: () {},
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 10,
              child: CustomButton(
                title: AppStrings.create_post_text,
                fontWeight: FontWeight.w700,
                fontSize: 13,
                height: 35,
                onPressed: () =>controller.addPost(),
              ),
            ),
            const Spacer(),
          ],
        ),
      );

  double heightBottomSheet(context) =>
      MediaQuery.of(context).size.height -
      (MediaQuery.of(context).padding.top) -
      kToolbarHeight;
}
