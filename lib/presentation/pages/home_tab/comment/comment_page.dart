import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/controllers/home_tab/comment/comment_controller.dart';
import 'package:chomoi/presentation/pages/comment/viewmodels/comment_view_model.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/home_tab/comment/comment_row.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentPage extends GetView<CommentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: CustomAppBar(
        title: AppStrings.all_comment_title,
        leading: AppBackButton(
          onBack: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: NotificationListener(
                onNotification: controller.onNotification,
                child: CustomScrollView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    _buildComment,
                    _buildLoadMoreComment,
                  ],
                ),
              ),
            ),
            _buildCommentBox
          ],
        ),
      ),
    );
  }

  Widget get _buildComment => GetX<CommentController>(builder: (controller) {
        return controller.commentState.when(
          loading: () => const SliverFillRemaining(
            hasScrollBody: false,
            child: LoadingScreen(),
          ),
          success: (comments) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return CommentRow(
                  viewModel: CommentViewModel.fromComment(comments[index]),
                );
              },
              childCount: comments.length,
            ),
          ),
          failure: (exception) =>
              const SliverToBoxAdapter(child: SizedBox.shrink()),
          init: (entity) => const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: LoadingScreen(),
            ),
          ),
        );
      });

  Widget get _buildLoadMoreComment =>
      GetX<CommentController>(builder: (controller) {
        return SliverToBoxAdapter(
          child: controller.isLoadingComment
              ? const LoadingScreen()
              : const SizedBox(),
        );
      });

  Widget get _buildCommentBox => GetX<CommentController>(
        builder: (controller) {
          return controller.userState.maybeWhen(
            success: (userModel) {
              final viewModel = CommentViewModel.fromCurrentUser(userModel);
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: AppConstant.iconAvatarBoxSize,
                      backgroundImage: NetworkImage(viewModel.myAvatar),
                      backgroundColor: Colors.transparent,
                    ),
                    const HBox(10),
                    Flexible(
                      child: TextFormField(
                        autofocus: false,
                        onChanged: controller.onChange,
                        controller: controller.commentController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                          hintText: AppStrings.add_comment_hint_text,
                          hintStyle: AppTextStyles.infoRegular13w400.copyWith(
                            color: AppColors.greyStorm,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                const BorderSide(color: AppColors.greyStorm),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                              color: AppColors.greyCloud,
                            ),
                          ),
                          suffix: GestureDetector(
                            onTap: controller.isEmptyComment
                                ? null
                                : controller.addComment,
                            child: Text(
                              AppStrings.post_text,
                              style:
                                  AppTextStyles.contentRegular15w400.copyWith(
                                color:
                                    controller.isEmptyComment
                                        ? AppColors.blueSky
                                        : AppColors.blueWater,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      );
}
