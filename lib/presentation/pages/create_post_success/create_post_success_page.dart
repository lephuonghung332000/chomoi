import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/controllers/create_post_success/create_post_success_controller.dart';
import 'package:chomoi/presentation/pages/create_post_success/viewmodels/post_success_view_model.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/create_post_success/post_success_box.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostSuccessPage extends GetView<CreatePostSuccessController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryContrastColor,
      appBar: CustomAppBar(
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
                slivers: [_buildSuccessBox, _buildInfoPost],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildSuccessBox => SliverToBoxAdapter(
        child: Container(
          color: AppColors.goldenYellow,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SvgIcon(
                    icon: AppAssets.iconCheckedCircle,
                    size: 18,
                  ),
                  const HBox(15),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.complete_post_text,
                          style: AppTextStyles.smallBold11w700.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        const VBox(6),
                        Text(
                          AppStrings.process_pending_post_text,
                          style: AppTextStyles.smallRegular11w400.copyWith(
                            color: AppColors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const VBox(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildCreatePostSuccessButton(
                    AppStrings.back_to_home_text,
                    () => controller.routeToHome(),
                  ),
                  const HBox(10),
                  _buildCreatePostSuccessButton(
                    AppStrings.manage_post_title,
                    () => controller.routeToMyPost(),
                  )
                ],
              )
            ],
          ),
        ),
      );

  Widget _buildCreatePostSuccessButton(String text, Function() onTap) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(4),
        ),
        height: 25,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onTap,
          child: Text(
            text,
            style: AppTextStyles.contentRegular15w400.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      );

  Widget get _buildInfoPost => GetX<CreatePostSuccessController>(
        builder: (controller) {
          return SliverToBoxAdapter(
            child: PostSuccessBox(
              viewModel: PostSuccessViewModel.fromPost(
                  controller.postRequestModel, controller.file),
            ),
          );
        },
      );
}
