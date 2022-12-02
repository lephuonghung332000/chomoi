import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/app/config/themes/cupertino_theme.dart';
import 'package:chomoi/app/util/get_model_bottom_sheet.dart';
import 'package:chomoi/app/util/validators.dart';
import 'package:chomoi/presentation/controllers/setting_tab/edit_user/edit_user_controller.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/create_post/select_address_view.dart';
import 'package:chomoi/presentation/widgets/cupertino_date_picker_field.dart';
import 'package:chomoi/presentation/widgets/cupertino_picker_field.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/custom_button.dart';
import 'package:chomoi/presentation/widgets/hanlde_popover.dart';
import 'package:chomoi/presentation/widgets/input_field.dart';
import 'package:chomoi/presentation/widgets/setting_tab/edit_user/display_avatar.dart';
import 'package:chomoi/presentation/widgets/setting_tab/edit_user/edit_address_view.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUserPage extends GetView<EditUserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryContrastColor,
      appBar: CustomAppBar(
        title: AppStrings.setup_user_title,
        leading: AppBackButton(
          onBack: () => Navigator.of(context).pop(null),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                _buildUserInfo(context),
                _buildButton,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return GetX<EditUserController>(
      builder: (controller) {
        return SliverToBoxAdapter(
          child: Form(
            key: controller.editUserFormKey,
            onChanged: controller.onValidForm,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      DisplayAvatar(
                        imagePath: controller.userViewModel.avatar,
                        onTap: () => showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) => _buildOptionSelectImage,
                        ),
                        file: controller.selectedFile,
                      ),
                    ],
                  ),
                ),
                const VBox(20),
                // family name
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InputField(
                    controller: controller.familyNameController,
                    keyboardType: TextInputType.text,
                    decoration: _inputDecoration(
                        AppStrings.input_family_name_hint_text),
                  ),
                ),
                // name
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InputField(
                    controller: controller.nameController,
                    decoration:
                        _inputDecoration(AppStrings.input_name_hint_text),
                  ),
                ),
                //email
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InputField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        _inputDecoration(AppStrings.input_email_hint_text),
                    validator: Validators.email,
                  ),
                ),
                // phone
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InputField(
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    decoration:
                        _inputDecoration(AppStrings.input_phone_hint_text),
                    validator: Validators.phoneNumber,
                  ),
                ),
                //birth day
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CupertinoDatePickerField(
                    controller: controller.birthdayController,
                    placeHolder: AppStrings.input_edit_birthday_hint_text,
                    selectedDate: controller.selectedDate,
                    onSelected: (value) {
                      controller.setSelectedDate(value);
                    },
                    decoration: _inputDecoration(
                        AppStrings.input_edit_birthday_hint_text),
                  ),
                ),
                // gender
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CupertinoPickerField(
                    controller: controller.genderController,
                    placeHolder: AppStrings.input_gender_hint_text,
                    selectedValue: controller.genders.first,
                    items: controller.genders,
                    decoration:
                        _inputDecoration(AppStrings.input_gender_hint_text),
                  ),
                ),
                // address
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InputField(
                    controller: controller.addressController,
                    decoration:
                        _inputDecoration(AppStrings.address_label_create_title),
                    onTap: () => _showBottomSheet(
                      EditAddressView(
                        address: controller.addressController.text,
                        height: heightBottomSheet(context),
                        onSubmit: (address) =>
                            controller.setAddressSelection(address),
                      ),
                      context,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget get _buildButton => SliverToBoxAdapter(
        child: GetX<EditUserController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              child: CustomButton(
                style: CustomButtonStyle.filled,
                title: AppStrings.update_title,
                minWidth: double.infinity,
                onPressed:
                    controller.isValidForm ? controller.updateUser : null,
              ),
            );
          },
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
                    onPressed: () => controller.selectImageFromGallery(),
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

  InputDecoration _inputDecoration(String label) => InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greyCloud,
          ),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: AppColors.greyCloud,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: AppColors.greyCloud,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: AppColors.errorColor,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: AppColors.errorColor,
          ),
        ),
        labelText: label,
        labelStyle: AppTextStyles.titleMediumRegular17w400.copyWith(
          color: AppColors.greyStorm,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorMaxLines: 2,
        errorStyle: AppTextStyles.infoRegular13w400.copyWith(
          color: AppColors.errorColor,
        ),
        isDense: true,
        suffixIconConstraints: const BoxConstraints(minWidth: 10),
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: 12),
          child: SvgIcon(
            icon: AppAssets.iconArrowRight,
            size: 12,
            color: AppColors.greyStorm,
          ),
        ),
      );

  double heightBottomSheet(context) =>
      MediaQuery.of(context).size.height -
      (MediaQuery.of(context).padding.top) -
      kToolbarHeight;
}
