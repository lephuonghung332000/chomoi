import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/app/util/validators.dart';
import 'package:chomoi/presentation/controllers/login/login_controller.dart';
import 'package:chomoi/presentation/widgets/custom_button.dart';
import 'package:chomoi/presentation/widgets/input_field.dart';
import 'package:chomoi/presentation/widgets/social_button.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetWidget<LoginController> {
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
            AppStrings.login_title,
            style: AppTextStyles.headlineSmallBold23w700.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          const VBox(5),
          Text(
            AppStrings.login_subtitle,
            style: AppTextStyles.contentRegular15w400.copyWith(
              color: AppColors.grayPhilippine,
            ),
          ),
        ],
      );

  Widget _buildForm() => Form(
        key: controller.loginFormKey,
        onChanged: controller.onValidForm,
        child: Column(
          children: [
            _buildInputEmailField(),
            const VBox(15),
            _buildInputPasswordField(),
            // login button
            const VBox(24),
            GetX<LoginController>(
              builder: (controller) {
                return CustomButton(
                  isLoading: controller.loginState.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  style: CustomButtonStyle.filled,
                  title: AppStrings.login_title,
                  minWidth: double.infinity,
                  onPressed: controller.isValidForm ? controller.login : null,
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

  Widget _buildInputPasswordField() => InputField(
        controller: controller.passwordController,
        placeholder: AppStrings.input_password_hint_text,
        password: true,
        validator: Validators.password,
      );

  Widget _buildFooter() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // forgot password
          CupertinoButton(
            disabledColor: Colors.transparent,
            onPressed: () {},
            child: Text(
              AppStrings.forgot_password_text,
              style: AppTextStyles.infoRegular13w400.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
          ),
          // social media
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              AppStrings.login_another_login,
              style: AppTextStyles.infoRegular13w400.copyWith(
                color: AppColors.grayPhilippine,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SocialButton(
                  imageName: AppAssets.imageGoogle,
                ),
                SocialButton(
                  imageName: AppAssets.imageFacebook,
                ),
                SocialButton(
                  imageName: AppAssets.imageZalo,
                ),
                SocialButton(
                  imageName: AppAssets.imageApple,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: AppStrings.login_not_have_account_text,
                    style: AppTextStyles.contentRegular15w400,
                  ),
                  TextSpan(
                    text: AppStrings.sign_up_now_text,
                    style: AppTextStyles.contentRegular15w400.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.routeToSingUpPage,
                  ),
                ],
              ),
            ),
          )
          // sign up
        ],
      );
}
