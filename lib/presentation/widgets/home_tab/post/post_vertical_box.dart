import 'package:cached_network_image/cached_network_image.dart';
import 'package:chomoi/app/config/constant/app_constants.dart';
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

class PostVerticalBox extends StatelessWidget {
  final VoidCallback? onTap;
  final PostViewModel viewModel;
  final int index;

  const PostVerticalBox({
    Key? key,
    this.onTap,
    required this.viewModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWellContainer(
      onTap: onTap,
      child: Container(
        height: AppConstant.heightPostViewVertical,
        decoration: BoxDecoration(
          border: Border(
            top: index == 0 || index == 1
                ? BorderSide(
                    color: theme.dividerColor,
                    width: 0.5,
                  )
                : BorderSide.none,
            bottom: BorderSide(
              color: theme.dividerColor,
              width: 0.5,
            ),
            right: index % 2 == 0
                ? BorderSide(
                    color: theme.dividerColor,
                    width: 0.5,
                  )
                : BorderSide.none,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(2),
                ),
                child: CachedNetworkImage(
                  imageUrl: viewModel.firstImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorWidget: (context, url, error) =>
                      const CupertinoActivityIndicator(),
                placeholder: (context, url) =>
                      const CupertinoActivityIndicator(),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VBox(5),
                  Flexible(
                    child: Text(
                      viewModel.titlePost,
                      style: AppTextStyles.infoRegular13w400,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  const VBox(3),
                  Flexible(
                    child: Text(
                      viewModel.formattedPrice,
                      style: AppTextStyles.infoRegular13w400.copyWith(
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.errorColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const VBox(3),
            Row(
              children: [
                if (viewModel.avatar.isNotEmpty)
                  CircleAvatar(
                    radius: AppConstant.iconAvatarPostSize,
                    backgroundImage: CachedNetworkImageProvider(viewModel.avatar),
                    backgroundColor: Colors.transparent,
                  )
                else
                  const SvgIcon(
                    icon: AppAssets.iconUserDefault,
                    size: AppConstant.iconAvatarPostSize,
                  ),
                const HBox(2),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      viewModel.postInfo,
                      style: AppTextStyles.tinyRegular10w400.copyWith(
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
    );
  }
}
