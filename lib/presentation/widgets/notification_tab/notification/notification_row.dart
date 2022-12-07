import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/app/types/notification/notification_enum.dart';
import 'package:chomoi/presentation/pages/notification_tab/notification/viewmodels/notification_view_models.dart';
import 'package:chomoi/presentation/widgets/ink_well_container.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/material.dart';

class NotificationRow extends StatelessWidget {
  final NotificationViewModel viewModel;
  final VoidCallback? onTap;

  static const double iconSize = 22;

  const NotificationRow({
    Key? key,
    this.onTap,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWellContainer(
      onTap: onTap,
      backgroundColor: viewModel.isRead
          ? AppColors.white
          : AppColors.primaryColor.withOpacity(0.1),
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 12, top: 18, bottom: 16),
        decoration: BoxDecoration(
          border: Border(
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
              child: SvgIcon(
                icon: viewModel.notificationType.icon,
                size: iconSize,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.title ?? '',
                    style: AppTextStyles.contentRegular15w400.copyWith(
                      color: viewModel.isRead
                          ? AppColors.greyStorm
                          : AppColors.blueDark,
                    ),
                  ),
                  const VBox(8),
                  Text(
                    viewModel.timeAgo,
                    style: AppTextStyles.infoRegular13w400.copyWith(
                      color: AppColors.greyStorm,
                    ),
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
