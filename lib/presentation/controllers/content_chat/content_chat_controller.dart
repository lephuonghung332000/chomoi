import 'dart:io';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:chomoi/app/config/constant/agora_constant.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/services/socket_service.dart';
import 'package:chomoi/app/util/file_converter.dart';
import 'package:chomoi/app/util/get_cupertino_dialog.dart';
import 'package:chomoi/domain/models/local/message_chat_local_model.dart';
import 'package:chomoi/domain/models/request/chat/message_chat_request_model.dart';
import 'package:chomoi/domain/models/state/states.dart';
import 'package:chomoi/domain/usecases/chat/add_message_chat_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socket_io_client/socket_io_client.dart' as client;

class ContentChatController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final AddMessageChatUseCase addMessageChatUseCase;

  ContentChatController({
    required this.addMessageChatUseCase,
  });

  final chatController = TextEditingController();

  final _isEmptyChat = true.obs;

  bool get isEmptyChat => _isEmptyChat.value;

  final _avatar = ''.obs;

  String get avatar => _avatar.value;

  final _name = ''.obs;

  String _myId = '';

  String _chatBoxId = '';

  final _remoteUid = 0.obs;

  int get remoteUid => _remoteUid.value;

  late RtcEngine _engine;

  String _userId = '';

  String _postId = '';

  final _socket = SocketService.get.socket;

  String get name => _name.value;

  File get selectedFile => _file.value;

  final _file = File('').obs;

  final ImagePicker imagePicker = ImagePicker();

  late client.Socket socket;

  final _messages = RxList<MessageChatLocalModel>();

  List<MessageChatLocalModel> get messages => _messages.toList();

  final ScrollController scrollController = ScrollController();

  late final AnimationController animationController;

  late final Animation<double> animation;

  final _addMessageChatState = const States<Unit>.init(
    entity: unit,
  ).obs;

  States<Unit> get addMessageChatState => _addMessageChatState.value;

  @override
  void onInit() {
    _initAnimation();
    _scrollToChat();
    _initArguments();
    _initAgora();
    _listenReceiveMessage();
    super.onInit();
  }

  Future<void> _initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(AgoraConstant.appIdAgora);
    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {},
        userJoined: (int uid, int elapsed) {
          _remoteUid.value = uid;
        },
        userOffline: (int uid, UserOfflineReason reason) {
          _remoteUid.value = 0;
        },
      ),
    );

    await _engine.joinChannel(null, "firstchannel", null, 0);
  }

  void removeImage() {
    _file.value = File('');
  }

  void _initAnimation() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );
  }

  Future<void> selectImageFromGallery() async {
    final XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      _file.value = File(selectedImage.path);
    }
    Get.back();
  }

  Future<void> selectImagesFromCamera() async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      _file.value = File(pickedImage.path);
    }
    Get.back();
  }

  @override
  void onClose() {
    _engine.leaveChannel();
    _engine.destroy();
    scrollController.dispose();
    chatController.dispose();
    super.onClose();
  }

  Future<void> sendMessage() async {
    if (chatController.text.isNotEmpty) {
      _scrollToChat();
      addMessageToServer();
      setMessage(
          isOwnMessage: true,
          message: chatController.text,
          sourceId: _myId,
          targetId: _userId,
          chatBoxId: _chatBoxId,
          imageSender: _file.value);
      SocketService.get.emitChat(
        message: chatController.text,
        sourceId: _myId,
        targetId: _userId,
        chatBoxId: _chatBoxId,
        path: _file.value.path,
      );

      chatController.clear();
    }
  }

  Future<void> addMessageToServer() async {
    //add to server
    final multipartFile =
        _file.value.path.isNotEmpty ? await _file.value.toMultipart : null;
    final result = await addMessageChatUseCase.call(
      MessageChatRequestModel(
        chatBoxId: _chatBoxId,
        content: chatController.text,
        sendBy: _myId,
        file: multipartFile,
        ownMessage: false,
      ),
    );
    result.fold((failure) {
      _addMessageChatState.value = States.failure(failure);
      Get.cupertinoDialog(
        title: AppStrings.error_title,
        middleText: AppStrings.dialog_error_chat_text,
        onConfirm: () => Get.back(),
        barrierDismissible: false,
      );
    }, (value) async {
      _addMessageChatState.value = States.success(entity: value);
    });
  }

  void _listenReceiveMessage() {
    _socket.on('message', (data) {
      _scrollToChat();
      setMessage(
        isOwnMessage: false,
        message: data['message'],
        sourceId: _userId,
        targetId: _myId,
        imageReceiver: data['image'],
        chatBoxId: data['chat_box_id'],
      );
    });
  }

  void setMessage({
    required bool isOwnMessage,
    required String message,
    required String sourceId,
    required String targetId,
    required String chatBoxId,
    File? imageSender,
    String? imageReceiver,
  }) {
    final now = DateTime.now();
    final timestamp = (now.millisecondsSinceEpoch) / 1000;
    if (imageSender != null) {
      final messageChatRequestModel = MessageChatLocalModel(
        chatBoxId: chatBoxId,
        content: message,
        sendBy: sourceId,
        imageSend: imageSender,
        createAt: timestamp,
        ownMessage: isOwnMessage,
      );
      _messages.add(messageChatRequestModel);
    } else if (imageReceiver != null) {
      final messageChatLocalModel = MessageChatLocalModel(
        chatBoxId: chatBoxId,
        content: message,
        sendBy: sourceId,
        imageReceive: imageReceiver,
        createAt: timestamp,
        ownMessage: isOwnMessage,
      );
      _messages.add(messageChatLocalModel);
    }
  }

  void onChange(String value) {
    _isEmptyChat.value = value.isEmpty;
    chatController.text = value;
    chatController.selection = TextSelection.fromPosition(
      TextPosition(offset: chatController.text.length),
    );
  }

  bool onNotification(ScrollNotification notification) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {}

    return false;
  }

  Future<void> _initArguments() async {
    if (Get.arguments != null) {
      if (Get.arguments['chat_box_id'] != null) {
        _chatBoxId = Get.arguments['chat_box_id'] as String;
      }
      if (Get.arguments['avatar'] != null) {
        _avatar.value = Get.arguments['avatar'] as String;
      }
      if (Get.arguments['name'] != null) {
        _name.value = Get.arguments['name'] as String;
      }
      if (Get.arguments['user_id'] != null) {
        _userId = Get.arguments['user_id'] as String;
      }
      if (Get.arguments['my_id'] != null) {
        _myId = Get.arguments['my_id'] as String;
      }
      if (Get.arguments['post_id'] != null) {
        _postId = Get.arguments['post_id'] as String;
      }
    }
  }

  void _scrollToChat() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }
}
