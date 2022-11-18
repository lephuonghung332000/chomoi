import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/pages/comment/viewmodels/comment_view_model.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';

class CommentRow extends StatelessWidget {
  final CommentViewModel viewModel;

  const CommentRow({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: AppConstant.iconAvatarBoxSize,
              backgroundImage: NetworkImage(viewModel.avatar),
              backgroundColor: Colors.transparent,
            ),
            const HBox(15),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ChatBubble(
                      clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                      backGroundColor:  AppColors.grayCloud,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewModel.name,
                            style: AppTextStyles.infoBold13w700,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          const VBox(5),
                          Expanded(
                            child: Text(
                              viewModel.contentComment,
                              style: AppTextStyles.infoRegular13w400.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VBox(5),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      viewModel.timeAgo,
                      style: AppTextStyles.tinyRegular10w400.copyWith(
                        color: AppColors.greyStorm,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
