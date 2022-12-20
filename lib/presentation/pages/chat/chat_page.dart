import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/presentation/controllers/chat/chat_controller.dart';
import 'package:chomoi/presentation/pages/chat/viewmodels/chat_view_model.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/chat/chat_row.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: CustomAppBar(
        title: AppStrings.chat_title,
        leading: AppBackButton(
          onBack: () => Navigator.of(context).pop(),
        ),
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
                    _buildChatList,
                    _buildLoadMoreChat,
                    _buildSpace,
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

  Widget get _buildChatList => GetX<ChatController>(builder: (controller) {
        return controller.chatState.when(
          loading: () => const SliverToBoxAdapter(
            child: SizedBox(),
          ),
          success: (entity) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final viewModel = ChatViewModel.fromChat(entity[index]);
                return ChatRow(
                  onTap: () => controller.routeContentChat(
                      avatar: viewModel.avatar,
                      userId: viewModel.userIdChat,
                      name: viewModel.fullnameChat,
                      postId: viewModel.postId,
                      chatBoxId: viewModel.chatBoxId),
                  index: index,
                  chatViewModel: viewModel,
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

  Widget get _buildLoadMoreChat => GetX<ChatController>(builder: (controller) {
        return SliverToBoxAdapter(
          child: controller.isLoadingChat
              ? const Padding(
                  padding: EdgeInsets.only(top: 10), child: LoadingScreen())
              : const SizedBox(),
        );
      });
}
