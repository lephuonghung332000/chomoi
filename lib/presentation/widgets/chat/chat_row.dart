import 'package:cached_network_image/cached_network_image.dart';
import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/app/types/notification/notification_enum.dart';
import 'package:chomoi/presentation/pages/chat/viewmodels/chat_view_model.dart';
import 'package:chomoi/presentation/widgets/ink_well_container.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/material.dart';

class ChatRow extends StatelessWidget {
  final VoidCallback? onTap;
  final ChatViewModel chatViewModel;
  final int index;

  static const double iconSize = 22;

  const ChatRow({
    Key? key,
    this.onTap,
    required this.chatViewModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWellContainer(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 12, top: 6, bottom: 16),
        decoration: BoxDecoration(
          border: Border(
            top: index == 0
                ? BorderSide(
                    color: theme.dividerColor,
                    width: 0.5,
                  )
                : BorderSide.none,
            bottom: BorderSide(
              color: theme.dividerColor,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 2),
              child: CircleAvatar(
                radius: AppConstant.iconAvatarChatSize,
                backgroundImage:
                    CachedNetworkImageProvider(chatViewModel.avatar),
                backgroundColor: Colors.transparent,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatViewModel.fullnameChat,
                    style: AppTextStyles.smallRegular11w400,
                  ),
                  const VBox(8),
                  Text(
                    chatViewModel.postTitleChat,
                    style: AppTextStyles.smallBold11w700,
                  ),
                  const VBox(8),
                  Text(
                    'Tin nhắn mới',
                    style: AppTextStyles.smallRegular11w400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension NotificationTypeExt on NotificationType {
  String get icon {
    switch (this) {
      case NotificationType.post_pending:
        return AppAssets.iconPostPending;
      case NotificationType.post_accept:
        return AppAssets.iconPostAccept;
      case NotificationType.post_reject:
        return AppAssets.iconPostReject;
      case NotificationType.ads:
        return AppAssets.iconAnnouncement;
    }
  }
}
