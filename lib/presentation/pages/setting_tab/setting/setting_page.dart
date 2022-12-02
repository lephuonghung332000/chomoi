import 'package:cached_network_image/cached_network_image.dart';
import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/presentation/controllers/setting_tab/setting/setting_controller.dart';
import 'package:chomoi/presentation/pages/home_tab/home/viewmodels/post_view_model.dart';
import 'package:chomoi/presentation/pages/setting_tab/setting/viewmodels/user_view_model.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:chomoi/presentation/widgets/my_post_tab/my_post/my_post_list_view.dart';
import 'package:chomoi/presentation/widgets/my_post_tab/my_post/my_post_row.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class SettingPage extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: CustomAppBar(
        title: AppStrings.manage_user_title,
        leading: const SizedBox(),
        actions: [
          GestureDetector(
            onTap: () => controller.logout(),
            child: const SvgIcon(
              icon: AppAssets.iconLogout,
              size: AppConstant.iconLogoutSize,
              color: AppColors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [_buildUserInfo(context), _buildAcceptPost],
            ),
          )
        ],
      )),
    );
  }

  Widget _buildAvatarAndName(
    BuildContext context,
    UserViewModel userViewModel,
  ) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: AppConstant.iconAvatarSettingSize,
            backgroundImage: CachedNetworkImageProvider(userViewModel.avatar),
            backgroundColor: Colors.transparent,
          ),
          const HBox(12),
          Flexible(
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userViewModel.nameUser,
                    style: AppTextStyles.contentBold15w700,
                  ),
                  const VBox(5),
                  Row(
                    children: [
                      RichText(
                        text: userViewModel.follower,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const HBox(10),
                      RichText(
                        text: userViewModel.isFollowing,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: const Size(64, 30),
                          foregroundColor: AppColors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            side: BorderSide(color: AppColors.greyStorm),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          textStyle: AppTextStyles.smallRegular11w400,
                        ),
                        onPressed: () =>
                            controller.routeEditUser(userViewModel),
                        child: const Text(AppStrings.edit_user_text),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.black,
                          minimumSize: const Size(28, 28),
                          shape: const CircleBorder(
                            side: BorderSide(
                              color: AppColors.greyStorm,
                            ),
                          ),
                          padding: const EdgeInsets.all(0),
                        ),
                        child: const SvgIcon(
                          icon: AppAssets.iconSettingActive,
                          color: AppColors.black,
                          size: AppConstant.iconMoreSetting,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) => SliverToBoxAdapter(
        child: GetX<SettingController>(
          builder: (controller) {
            return controller.userState.when(
              init: (_) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: LoadingScreen(),
              ),
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: LoadingScreen(),
              ),
              failure: (_) => const SizedBox.shrink(),
              success: (userModel) {
                final userViewModel = UserViewModel.fromUser(userModel);
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  color: AppColors.white,
                  child: Column(
                    children: [
                      _buildAvatarAndName(context, userViewModel),
                      _buildAdditionalInfo(userViewModel),
                    ],
                  ),
                );
              },
            );
          },
        ),
      );

  Widget _buildAdditionalInfo(UserViewModel userViewModel) {
    final rating = userViewModel.rating;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _buildIconAndName(
            AppAssets.iconStar,
            userViewModel.ratingInfo(rating),
            rating: rating,
          ),
          _buildIconAndName(
            AppAssets.iconCalendar,
            userViewModel.dateJoin,
          ),
          _buildIconAndName(
            AppAssets.iconMap,
            userViewModel.addressInfo,
          ),
          _buildIconAndName(
            AppAssets.iconChat,
            userViewModel.replyInfo,
          )
        ],
      ),
    );
  }

  Widget _buildIconAndName(
    String icon,
    TextSpan text, {
    double? rating,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(children: [
          SvgIcon(
            icon: icon,
            size: 18,
            color: AppColors.greyStorm,
          ),
          const HBox(5),
          Flexible(
            child: RichText(
              text: text,
            ),
          ),
          if (rating != null)
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: RatingBar.builder(
                itemSize: 18,
                initialRating: rating,
                minRating: 0,
                direction: Axis.horizontal,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: AppColors.goldenYellow,
                ),
                onRatingUpdate: (_) {},
              ),
            ),
        ]),
      );

  Widget get _buildAcceptPost => SliverToBoxAdapter(
        child: GetX<SettingController>(
          builder: (controller) => controller.postAcceptState.when(
            loading: () => const SizedBox.shrink(),
            success: (post) {
              final shortedPosts = post.posts.take(3).toList();
              return Column(
                children: [
                  Container(
                    color: AppColors.white,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: AppStrings.is_being_showed_text,
                              style: AppTextStyles.contentBold15w700.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                            TextSpan(
                              text: AppStrings.count_post_text(post.total),
                              style: AppTextStyles.infoRegular13w400.copyWith(
                                color: AppColors.greyStorm,
                              ),
                            ),
                          ]),
                        ),
                        ..._buildPost(shortedPosts),
                        _buildButtonSeeAll(post.posts)
                      ],
                    ),
                  ),
                ],
              );
            },
            failure: (exception) => const SizedBox.shrink(),
            init: (_) => const SizedBox.shrink(),
          ),
        ),
      );

  List<Widget> _buildPost(List<PostModel> shortedPosts) {
    return shortedPosts
        .asMap()
        .entries
        .map(
          (element) => MyPostRow(
            viewModel: PostViewModel.fromPost(element.value),
            isShowFooter: false,
            postType: PostType.accept,
            onTap: () => controller.routePostDetail(
              postModel: element.value,
            ),
            isShowOption: false,
          ),
        )
        .toList();
  }

  Widget _buildButtonSeeAll(List<PostModel> posts) => GestureDetector(
        onTap: () => controller.routeAllMyPost(posts),
        child: Container(
          padding: const EdgeInsets.only(top: 14, bottom: 6),
          color: AppColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.see_all_text,
                style: AppTextStyles.contentBold15w700.copyWith(
                  color: AppColors.blue,
                ),
              ),
              const HBox(10),
              const SvgIcon(
                icon: AppAssets.iconArrowRight,
                size: 10,
                color: AppColors.blue,
              )
            ],
          ),
        ),
      );
}
