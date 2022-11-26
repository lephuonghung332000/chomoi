import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/pages/create_post_success/viewmodels/post_success_view_model.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/material.dart';

class PostSuccessBox extends StatelessWidget {
  final VoidCallback? onPress;
  final PostSuccessViewModel viewModel;

  const PostSuccessBox({
    Key? key,
    this.onPress,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: AppConstant.heightPostViewHorizontal,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor,
          ),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(2),
                  ),
                  child: Image.file(
                    viewModel.image,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      AppStrings.wait_for_process_post_text,
                      style: AppTextStyles.smallBold11w700.copyWith(
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          const HBox(10),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.title,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
