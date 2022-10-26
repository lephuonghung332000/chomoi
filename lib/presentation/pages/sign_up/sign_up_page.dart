import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/app/util/validators.dart';
import 'package:chomoi/domain/models/response/country/district_model.dart';
import 'package:chomoi/domain/models/response/country/province_model.dart';
import 'package:chomoi/domain/models/response/country/ward_model.dart';
import 'package:chomoi/presentation/controllers/sign_up/sign_up_controller.dart';
import 'package:chomoi/presentation/widgets/app_activity_indicator.dart';
import 'package:chomoi/presentation/widgets/cupertino_date_picker_field.dart';
import 'package:chomoi/presentation/widgets/cupertino_picker_field.dart';
import 'package:chomoi/presentation/widgets/custom_button.dart';
import 'package:chomoi/presentation/widgets/input_field.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetWidget<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.bottomCenter,
              image: AssetImage(AppAssets.imageLoginBackground),
              fit: BoxFit.contain,
            ),
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 28),
            children: [
              const VBox(24),
              const SvgIcon(
                icon: AppAssets.appLogoText,
                size: 120,
              ),
              const VBox(28),
              _buildLabel(),
              const VBox(24),
              _buildForm(),
              const VBox(24),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.sign_up_title,
            style: AppTextStyles.headlineSmallBold23w700.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          const VBox(5),
          Text(
            AppStrings.sign_up_subtitle,
            style: AppTextStyles.contentRegular15w400.copyWith(
              color: AppColors.grayPhilippine,
            ),
          ),
        ],
      );

  Widget _buildForm() => Form(
        key: controller.signUpFormKey,
        onChanged: controller.onValidForm,
        child: Column(
          children: [
            _buildInputEmailField(),
            const VBox(15),
            _buildInputFamilyNameField(),
            const VBox(15),
            _buildInputNameField(),
            const VBox(15),
            _buildInputPhoneField(),
            const VBox(15),
            _buildInputGenderField(),
            const VBox(15),
            _buildInputBirthdayField(),
            const VBox(15),
            _buildInputProvinceField(),
            const VBox(15),
            _buildInputDistrictField(),
            const VBox(15),
            _buildInputWardField(),
            const VBox(15),
            _buildInputPasswordField(),
            // login button
            const VBox(24),
            GetX<SignUpController>(
              builder: (controller) {
                return CustomButton(
                  style: CustomButtonStyle.filled,
                  title: AppStrings.sign_up_title,
                  minWidth: double.infinity,
                  isLoading: controller.signUpState.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: controller.isValidForm ? controller.signUp : null,
                );
              },
            )
          ],
        ),
      );

  Widget _buildInputEmailField() => InputField(
        controller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
        placeholder: AppStrings.input_email_hint_text,
        validator: Validators.email,
      );

  Widget _buildInputFamilyNameField() => InputField(
        controller: controller.familyNameController,
        keyboardType: TextInputType.name,
        placeholder: AppStrings.input_family_name_hint_text,
      );

  Widget _buildInputNameField() => InputField(
        controller: controller.nameController,
        keyboardType: TextInputType.name,
        placeholder: AppStrings.input_name_hint_text,
      );

  Widget _buildInputPhoneField() => InputField(
        controller: controller.phoneController,
        keyboardType: TextInputType.phone,
        placeholder: AppStrings.input_phone_hint_text,
        validator: Validators.phoneNumber,
      );

  Widget _buildInputGenderField() => CupertinoPickerField(
        controller: controller.genderController,
        placeHolder: AppStrings.input_gender_hint_text,
        selectedValue: controller.genders.first,
        items: controller.genders,
      );

  Widget _buildInputProvinceField() => GetX<SignUpController>(
        builder: (controller) {
          return CupertinoPickerField<ProvinceModel>(
            controller: controller.provinceController,
            placeHolder: AppStrings.input_province_hint_text,
            selectedValue: controller.selectedProvince,
            canSelected: controller.provincesState.maybeWhen(
              success: (_) => true,
              orElse: () => false,
            ),
            items: controller.provincesState.maybeWhen(
              success: (values) => values,
              orElse: () => [],
            ),
            onSelected: (value) {
              controller.setSelectedProvince(value);
              controller.getDistricts(provinceId: value?.provinceId);
            },
            suffixIcon: controller.provincesState.maybeWhen(
              loading: () => const AppActivityIndicator(
                size: 8,
                color: AppColors.grayPhilippine,
              ),
              orElse: () => null,
            ),
          );
        },
      );

  Widget _buildInputBirthdayField() => GetX<SignUpController>(
        builder: (controller) {
          return CupertinoDatePickerField(
            controller: controller.birthdayController,
            placeHolder: AppStrings.input_birthday_hint_text,
            selectedDate: controller.selectedDate,
            onSelected: (value) {
              controller.setSelectedDate(value);
            },
          );
        },
      );

  Widget _buildInputDistrictField() => GetX<SignUpController>(
        builder: (controller) {
          return CupertinoPickerField<DistrictModel>(
            controller: controller.districtController,
            placeHolder: AppStrings.input_district_hint_text,
            selectedValue: controller.selectedDistrict,
            canSelected: controller.districtsState.maybeWhen(
              success: (_) => true,
              orElse: () => false,
            ),
            items: controller.districtsState.maybeWhen(
              success: (values) => values,
              orElse: () => [],
            ),
            onSelected: (value) {
              controller.setSelectedDistrict(value);
              controller.getWards(wardId: value?.districtId);
            },
            suffixIcon: controller.districtsState.maybeWhen(
              loading: () => const AppActivityIndicator(
                size: 8,
                color: AppColors.grayPhilippine,
              ),
              orElse: () => null,
            ),
          );
        },
      );

  Widget _buildInputWardField() => GetX<SignUpController>(
        builder: (controller) {
          return CupertinoPickerField<WardModel>(
            controller: controller.wardController,
            placeHolder: AppStrings.input_ward_hint_text,
            selectedValue: controller.selectedWard,
            canSelected: controller.wardState.maybeWhen(
              success: (_) => true,
              orElse: () => false,
            ),
            items: controller.wardState.maybeWhen(
              success: (values) => values,
              orElse: () => [],
            ),
            onSelected: (value) {
              controller.setSelectedWard(value);
            },
            suffixIcon: controller.wardState.maybeWhen(
              loading: () => const AppActivityIndicator(
                size: 8,
                color: AppColors.grayPhilippine,
              ),
              orElse: () => null,
            ),
          );
        },
      );

  Widget _buildInputPasswordField() => InputField(
        controller: controller.passwordController,
        placeholder: AppStrings.input_password_hint_text,
        password: true,
        validator: Validators.password,
      );

  Widget _buildFooter() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
              top: 15,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: AppStrings.sign_up_have_account_text,
                    style: AppTextStyles.contentRegular15w400,
                  ),
                  TextSpan(
                    text: AppStrings.login_title,
                    style: AppTextStyles.contentRegular15w400.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = Get.back,
                  ),
                ],
              ),
            ),
          )
          // sign up
        ],
      );
}
