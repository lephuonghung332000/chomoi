import 'package:cached_network_image/cached_network_image.dart';
import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/pages/home_tab/home/viewmodels/post_view_model.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/ink_well_container.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPostRow extends StatelessWidget {
  final PostViewModel viewModel;
  final VoidCallback? onTap;
  final bool isReject;

  const MyPostRow({
    Key? key,
    this.onTap,
    required this.viewModel,
    this.isReject = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstant.heightMyPostViewHorizontal,
      color: AppColors.white,
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: isReject
                            ? ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  AppColors.black.withOpacity(0.8),
                                  BlendMode.color,
                                ),
                                child: _buildImagePost,
                              )
                            : _buildImagePost,
                      ),
                    ),
                    const HBox(10),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewModel.titlePost,
                            style: AppTextStyles.infoRegular13w400,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          const VBox(3),
                          Expanded(
                            child: Text(
                              viewModel.formattedPrice,
                              style: AppTextStyles.infoRegular13w400.copyWith(
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.ellipsis,
                                color: AppColors.errorColor,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              if (viewModel.avatar.isNotEmpty)
                                Flexible(
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Text(
                                      viewModel.time,
                                      style: AppTextStyles.tinyRegular10w400
                                          .copyWith(
                                        color: AppColors.greyStorm,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SvgIcon(
                      size: 16,
                      icon: AppAssets.iconMore,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const VBox(10),
          if (isReject)
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 0.5,
                  ),
                  top: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 0.5,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.see_reason_reject_post_title,
                    style: AppTextStyles.contentBold15w700.copyWith(
                      color: AppColors.errorColor,
                    ),
                  ),
                ],
              ),
            )
          else
            Row(
              children: [
                Expanded(
                  child: _buildOption(
                    context,
                    AppAssets.iconStatistic,
                    AppStrings.see_statistic_title,
                    isShowBorderRight: true,
                  ),
                ),
                Expanded(
                  child: _buildOption(
                    context,
                    AppAssets.iconShutDownEye,
                    AppStrings.see_hide_show_post_title,
                  ),
                )
              ],
            )
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, String icon, String text,
          {bool isShowBorderRight = false}) =>
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 0.5,
            ),
            top: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 0.5,
            ),
            right: isShowBorderRight
                ? BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  )
                : BorderSide.none,
          ),
        ),
        padding: const EdgeInsets.all(7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(
              icon: icon,
              size: 16,
            ),
            const HBox(5),
            Text(
              text,
              style: AppTextStyles.smallRegular11w400.copyWith(
                color: AppColors.blue,
              ),
            ),
          ],
        ),
      );

  Widget get _buildImagePost => CachedNetworkImage(
        imageUrl: viewModel.firstImage,
        height: double.infinity,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) =>
            const CupertinoActivityIndicator(),
        placeholder: (context, url) => const CupertinoActivityIndicator(),
      );
}
