import 'package:chomoi/presentation/widgets/ink_well_container.dart';
import 'package:flutter/material.dart';

class NotificationRow extends StatelessWidget {
  // final NotificationViewModel viewModel;
  final VoidCallback? onTap;

  static const double iconSize = 22;

  const NotificationRow({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWellContainer(
      onTap: onTap,
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
            // Padding(
            //   padding: const EdgeInsets.only(right: 20, top: 2),
            //   child: SvgIcon(
            //     icon: viewModel.notificationType!.icon,
            //     size: iconSize,
            //     color: viewModel.isRead!
            //         ? AppColors.greyStorm
            //         : AppColors.blue,
            //   ),
            // ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   viewModel.body,
                  //   style: AppTextStyles.contentRegular15w400.copyWith(
                  //     color: viewModel.isRead!
                  //         ? AppColors.greyStorm
                  //         : AppColors.blueDark,
                  //   ),
                  // ),
                  // const VBox(8),
                  // Text(
                  //   viewModel.timeAgo,
                  //   style: AppTextStyles.infoRegular13w400.copyWith(
                  //     color: AppColors.greyStorm,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
// extension NotificationTypeExt
// on NotificationType {
//   String get icon {
//     switch (this) {
//       case UserNotificationResponseModelNotificationTypeEnum
//           .DOCTOR_INVOICE_PAYMENT:
//         return AppAssets.iconInvoice;
//       default:
//         return AppAssets.iconDownload;
//     }
//   }
// }
