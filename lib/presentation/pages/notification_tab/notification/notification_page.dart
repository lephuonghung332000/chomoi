import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/presentation/controllers/notification_tab/notification/notification_controller.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: CustomAppBar(
        title: AppStrings.manage_user_title,
        leading: const SizedBox(),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [],
            ),
          )
        ],
      )),
    );
  }

  // Widget get _buildNotificationList =>
  //     GetX<NotificationController>(builder: (controller) {
  //       return controller.searchState.when(
  //         loading: () => const SliverToBoxAdapter(
  //           child: Padding(
  //             padding: EdgeInsets.only(top: 10),
  //             child: LoadingScreen(),
  //           ),
  //         ),
  //         success: (entity) => SliverList(
  //           delegate: SliverChildBuilderDelegate(
  //             (context, index) {
  //               return SearchRow(
  //                 viewModel: SearchViewModel.fromSearch(
  //                   entity[index],
  //                 ),
  //                 onTap: () => controller.routeToPostPage(
  //                   search: entity[index].key,
  //                 ),
  //               );
  //             },
  //             childCount: entity.length,
  //           ),
  //         ),
  //         failure: (exception) => const SliverToBoxAdapter(
  //           child: SizedBox.shrink(),
  //         ),
  //         init: (entity) => const SliverToBoxAdapter(
  //           child: Padding(
  //             padding: EdgeInsets.only(top: 10),
  //             child: LoadingScreen(),
  //           ),
  //         ),
  //       );
  //     });
}
