import 'package:chomoi/app/services/auth_service.dart';
import 'package:chomoi/domain/models/response/chat/chat_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/chat/fetch_chat_use_case.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final FetchChatUseCase fetchChatUseCase;

  ChatController({
    required this.fetchChatUseCase,
  });

  int _page = 1;
  int _total = 0;
  final List<ChatModel> _chats = [];

  String _myId = '';

  final _chatState = const States<List<ChatModel>>.init(
    entity: [],
  ).obs;

  States<List<ChatModel>> get chatState => _chatState.value;

  final _isLoadingChat = false.obs;

  bool get isLoadingChat => _isLoadingChat.value;

  bool onNotification(ScrollNotification notification) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      _fetchChat(page: _page + 1);
    }

    return false;
  }

  @override
  void onInit() {
    super.onInit();
    _initArguments();
    _fetchChat();
  }

  Future<void> _initArguments() async {
    if (Get.arguments != null) {
      if (Get.arguments['my_id'] != null) {
        _myId = Get.arguments['my_id'] as String;
      }
    }
  }

  Future<void> _fetchChat({int page = 1}) async {
    if (_total > 0 && _chats.length >= _total) {
      return;
    }

    if (_isLoadingChat.value) {
      return;
    }

    _isLoadingChat.value = true;
    if (page == 1) {
      _chatState.value = const States.loading();
    }
    final userId = AuthService.get.getCurrentUserId();
    if (userId == null) {
      return;
    }
    final result = await fetchChatUseCase.call(
      Tuple2(page, userId),
    );
    result.fold((failure) {
      if (page == 1) {
        _chatState.value = States.failure(failure);
      }
    }, (value) async {
      _page = page;
      _total = value.total;
      _chats.addAll(value.chats);
      _chatState.value = States.success(entity: _chats);
      _chatState.refresh();
    });
    _isLoadingChat.value = false;
  }

  void routeContentChat(
      {required String avatar,
      required String userId,
      required String name,
      required String postId,
      required String chatBoxId}) {
    Get.toNamed(
      AppPages.contentChatPage.name,
      arguments: {
        'avatar': avatar,
        'name': name,
        'my_id': _myId,
        'user_id': userId,
        'chat_box_id': chatBoxId,
        'post_id': postId,
      },
    );
  }
}
