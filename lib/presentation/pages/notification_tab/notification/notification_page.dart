import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/presentation/controllers/notification_tab/notification/notification_controller.dart';
import 'package:chomoi/presentation/pages/notification_tab/notification/viewmodels/notification_view_models.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:chomoi/presentation/widgets/notification_tab/notification/notification_row.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: CustomAppBar(
        title: AppStrings.notification_title,
        leading: const SizedBox(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: NotificationListener(
                onNotification: controller.onNotification,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    _buildNotificationList,
                    _buildLoadMoreNotification,
                    _buildSpace
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get _buildSpace => const SliverToBoxAdapter(
        child: VBox(40),
      );

  Widget get _buildNotificationList =>
      GetX<NotificationController>(builder: (controller) {
        return controller.state.when(
          loading: () => const SliverToBoxAdapter(
            child: SizedBox(),
          ),
          success: (entity) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final viewModel = controller.notifications[index];
                return NotificationRow(
                  viewModel: NotificationViewModel.fromNotifications(
                    viewModel,
                  ),
                  onTap: () => controller.routeToNotificationDetail(viewModel),
                );
              },
              childCount: entity.length,
            ),
          ),
          failure: (exception) => const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          ),
          init: (entity) => const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: LoadingScreen(),
            ),
          ),
        );
      });

  Widget get _buildLoadMoreNotification =>
      GetX<NotificationController>(builder: (controller) {
        return SliverToBoxAdapter(
          child: controller.isLoadingNotification
              ? const Padding(
                  padding: EdgeInsets.only(top: 10), child: LoadingScreen())
              : const SizedBox(),
        );
      });
}
