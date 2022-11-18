import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/constant/app_url_constant.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/app/util/url_launcher.dart';
import 'package:chomoi/presentation/controllers/post_detail/post_detail_controller.dart';
import 'package:chomoi/presentation/pages/comment/viewmodels/comment_view_model.dart';
import 'package:chomoi/presentation/pages/home_tab/home/viewmodels/post_view_model.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/home_tab/comment/comment_row.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:chomoi/presentation/widgets/post_detail/gallery_photo_view_wrapper.dart';
import 'package:chomoi/presentation/widgets/post_detail/related_post_list_view.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sliver_tools/sliver_tools.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({Key? key}) : super(key: key);

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  final tag = Get.arguments['tag'] as String;
  late final controller = Get.find<PostDetailController>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: NotificationListener(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    _buildHeader,
                    _buildGalleryView(context),
                    _buildInfoPost,
                    _buildDivider,
                    _buildUserInfo,
                    _buildContentPost,
                    _buildCommentPost,
                    _buildTerm,
                    _buildRelatedPost(context),
                    _buildSpace
                  ],
                ),
              ),
            ),
            _buildFooter
          ],
        ),
      ),
    );
  }

  Widget get _buildFooter =>
      GetX<PostDetailController>(
        global: false,
        init: controller,
        builder: (controller) =>
            controller.userState.maybeWhen(
                success: (entity) {
                  final viewModel = PostViewModel.fromPost(
                      controller.postDetail);
                  return (entity.email.compareTo(viewModel.emailUser) != 0)
                      ? IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: _buildPhoneItem(
                            AppAssets.iconCall,
                            AppStrings.call_action_text,
                            viewModel.phoneUser,
                          ),
                        ),
                        const VerticalDivider(
                          width: 1,
                          color: AppColors.greyStorm,
                        ),
                        Expanded(
                          flex: 3,
                          child: _buildMessageItem(
                              AppAssets.iconSms, AppStrings.sms_action_text,
                              data: viewModel.phoneUser),
                        ),
                        const VerticalDivider(
                          width: 2,
                          color: AppColors.greyStorm,
                        ),
                        Expanded(
                          flex: 3,
                          child: _buildMessageItem(
                            AppAssets.iconChatDetail,
                            AppStrings.chat_action_text,
                          ),
                        ),
                      ],
                    ),
                  )
                      : const SizedBox();
                },
                orElse: () => const SizedBox()),
      );

  Widget get _buildTerm =>
      SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          color: AppColors.white,
          child: Column(
            children: [
              _buildTermItem(
                icon: AppAssets.iconShield,
                text: AppStrings.guaranted_text,
                italic: true,
                moreText: AppStrings.see_more_text,
              ),
              const VBox(10),
              _buildTermItem(
                icon: AppAssets.iconGoWith,
                text: AppStrings.go_with_another_text,
                italic: false,
                moreText: AppStrings.find_more_text,
              )
            ],
          ),
        ),
      );

  Widget get _buildSpace =>
      const SliverToBoxAdapter(
        child: VBox(30),
      );

  Widget get _buildCommentPost =>
      GetX<PostDetailController>(
        global: false,
        init: controller,
        builder: (controller) =>
            SliverToBoxAdapter(
              child: controller.commentState.when(
                  init: (entity) => const SizedBox.shrink(),
                  loading: () =>
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: LoadingScreen(),
                  ),
                  failure: (exception) => const SizedBox.shrink(),
                  success: (comment) {
                    return Container(
                      color: AppColors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Divider(
                            color: AppColors.greyStorm,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: FittedBox(
                                    child: Text(
                                      '${AppStrings.comment_title} (${controller
                                          .total})',
                                      style: AppTextStyles.contentBold15w700,
                                    ),
                                  ),
                                ),
                                if (controller.total > 0)
                                  GestureDetector(
                                    onTap: controller.routeAllComment,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.greyStorm,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: Text(
                                          AppStrings.see_more_comment_title,
                                          style: AppTextStyles
                                              .contentRegular15w400
                                              .copyWith(
                                              color: AppColors.primaryColor),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                CommentRow(
                                  viewModel:
                                  CommentViewModel.fromComment(comment[index]),
                                ),
                            itemCount: comment.length,
                          ),
                          const Divider(
                            color: AppColors.greyStorm,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
      );

  Widget _buildRelatedPost(BuildContext context) =>
      GetX<PostDetailController>(
          global: false,
          init: controller,
          builder: (controller) {
            final theme = Theme.of(context);
            return SliverToBoxAdapter(
              child: controller.postState.when(
                loading: () =>
                const Padding(
                    padding: EdgeInsets.only(top: 10), child: LoadingScreen()),
                success: (entity) =>
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: entity.isNotEmpty
                                ? Border(
                              bottom: BorderSide(
                                color: theme.dividerColor,
                                width: 0.5,
                              ),
                            )
                                : null,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  AppStrings.related_post_title,
                                  style: AppTextStyles.contentBold15w700,
                                ),
                              ),
                              SizedBox(
                                height: AppConstant.heightPostViewVertical,
                                child: RelatedPostListView(
                                    posts: entity,
                                    onTap: (post) {
                                      controller.routePostDetail(
                                          postModel: post);
                                    }),
                              ),
                            ],
                          ),
                        ),
                        if (entity.isNotEmpty) _buildButtonSeeAll
                      ],
                    ),
                failure: (exception) => const SizedBox.shrink(),
                init: (entity) => const SizedBox.shrink(),
              ),
            );
          });

  Widget _buildTermItem({required String icon,
    required String text,
    required bool italic,
    required String moreText}) =>
      Row(
        children: [
          Image.asset(
            icon,
            width: 30,
            height: 30,
          ),
          const HBox(10),
          Flexible(
            child: RichText(
              maxLines: 5,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: text,
                    style: AppTextStyles.contentRegular15w400.apply(
                      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
                    ),
                  ),
                  TextSpan(
                    text: moreText,
                    style: AppTextStyles.contentRegular15w400.copyWith(
                      color: AppColors.primaryColor,
                      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => UrlLauncher.openUrl(AppUrlConstant.termPage),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildMessageItem(String icon, String text, {String data = ''}) =>
      GestureDetector(
        onTap: data.isNotEmpty ? () => controller.composeSms(data) : null,
        child: Column(
          children: [
            Image.asset(
              icon,
              width: 24,
              height: 24,
            ),
            const VBox(5),
            Text(
              text,
              style: AppTextStyles.infoRegular13w400,
            ),
          ],
        ),
      );

  Widget _buildPhoneItem(String icon, String text, String phoneNumber) =>
      GestureDetector(
        onTap: () => controller.callPhone(phoneNumber),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: AppColors.blueWater,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: 24,
                height: 24,
              ),
              const HBox(5),
              Text(
                text,
                style: AppTextStyles.infoBold13w700
                    .copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      );

  Widget get _buildDivider =>
      SliverToBoxAdapter(
        child: Container(
          color: AppColors.white,
          child: const Divider(
            color: AppColors.greyStorm,
          ),
        ),
      );

  Widget get _buildButtonSeeAll =>
      GestureDetector(
        onTap: () =>  controller.routeRelatedPost(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
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

  Widget get _buildHeader =>
      SliverPinnedHeader(
        child: Container(
          color: AppColors.primaryColor,
          alignment: Alignment.bottomCenter,
          height: AppConstant.heightAppBarWithoutSearchBar,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBackButton(
                onBack: () => Get.back(),
              ),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                onPressed: () {},
                child: const SvgIcon(
                  size: 16,
                  icon: AppAssets.iconMore,
                ),
              )
            ],
          ),
        ),
      );

  Widget _buildGalleryView(BuildContext context) =>
      GetX<PostDetailController>(
        global: false,
        init: controller,
        builder: (controller) {
          return SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () => _openGallery(context),
              child: SizedBox(
                height: AppConstant.heightPhotoGallery,
                child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      disableGestures: true,
                      imageProvider: NetworkImage(
                        controller.postDetail.images[index],
                      ),
                      heroAttributes: PhotoViewHeroAttributes(
                        tag: controller.postDetail.images[index],
                      ),
                      initialScale: PhotoViewComputedScale.covered,
                    );
                  },
                  itemCount: controller.postDetail.images.length,
                  loadingBuilder: (context, progress) => const LoadingScreen(),
                  backgroundDecoration:
                  const BoxDecoration(color: Colors.white),
                  onPageChanged: controller.setSelectedIndex,
                ),
              ),
            ),
          );
        },
      );

  Widget get _buildInfoPost =>
      GetX<PostDetailController>(
        global: false,
        init: controller,
        builder: (controller) {
          final viewModel = PostViewModel.fromPost(controller.postDetail);
          return SliverToBoxAdapter(
            child: Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    viewModel.titlePost,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.titleMediumBold17w700,
                  ),
                  const VBox(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        viewModel.formattedPrice,
                        style: AppTextStyles.contentRegular15w400.copyWith(
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.errorColor,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.errorColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.button_save_post_text,
                              style: AppTextStyles.contentRegular15w400
                                  .copyWith(color: AppColors.errorColor),
                            ),
                            const HBox(3),
                            const SvgIcon(
                              icon: AppAssets.iconHeart,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const VBox(5),
                  Text(
                    viewModel.timeAgo,
                    style: AppTextStyles.infoRegular13w400.copyWith(
                      color: AppColors.greyStorm,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const VBox(15),
                  Row(
                    children: [
                      const SvgIcon(icon: AppAssets.iconLocation),
                      const HBox(5),
                      Flexible(
                        child: Text(
                          viewModel.addressPost,
                          style: AppTextStyles.infoRegular13w400,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );

  Widget get _buildContentPost =>
      GetX<PostDetailController>(
        global: false,
        init: controller,
        builder: (controller) {
          final viewModel = PostViewModel.fromPost(controller.postDetail);
          return SliverToBoxAdapter(
            child: Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(12),
              child: Text(viewModel.contentPost),
            ),
          );
        },
      );

  Widget get _buildUserInfo =>
      GetX<PostDetailController>(
        global: false,
        init: controller,
        builder: (controller) {
          final viewModel = PostViewModel.fromPost(controller.postDetail);
          return SliverToBoxAdapter(
            child: Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        if (viewModel.avatar.isNotEmpty)
                          CircleAvatar(
                            radius: AppConstant.iconAvatarPostDetailSize,
                            backgroundImage: NetworkImage(viewModel.avatar),
                            backgroundColor: Colors.transparent,
                          )
                        else
                          const SvgIcon(
                            icon: AppAssets.iconUserDefault,
                            size: AppConstant.iconAvatarPostDetailSize,
                          ),
                        const HBox(15),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                viewModel.nameUser,
                                style: AppTextStyles.contentBold15w700,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const VBox(5),
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  viewModel.dateJoinPost,
                                  style:
                                  AppTextStyles.tinyRegular10w400.copyWith(
                                    color: AppColors.greyStorm,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      AppStrings.see_page_text,
                      style: AppTextStyles.contentRegular15w400
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

  void _openGallery(BuildContext context) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              GalleryPhotoViewWrapper(
                galleryItems: controller.postDetail.images
                    .map(
                      (e) => GalleryExampleItem(id: e, resource: e),
                )
                    .toList(),
                backgroundDecoration: const BoxDecoration(
                  color: AppColors.black,
                ),
                initialIndex: controller.selectedIndex,
                scrollDirection: Axis.horizontal,
                loadingBuilder: (context, progress) => const LoadingScreen(),
              ),
        ),
      );
}
