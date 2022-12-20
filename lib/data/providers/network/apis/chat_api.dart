import 'dart:convert';

import 'package:chomoi/data/dto/request/chat/chat_request_dto.dart';
import 'package:chomoi/data/dto/request/chat/message_chat_request_dto.dart';
import 'package:chomoi/data/providers/network/api_provider.dart';
import 'package:chomoi/data/providers/network/api_request_representable.dart';

enum ChatType { fetchChat, addChat, addMessageChat, fetchMessageChat }

class ChatApi implements APIRequestRepresentable {
  final ChatType type;
  final int? page;
  final String? userId;
  final String? chatBoxId;
  final ChatRequestDto? chatRequestDto;
  final MessageChatRequestDto? messageChatRequestDto;

  ChatApi._({
    required this.type,
    this.page,
    this.userId,
    this.chatRequestDto,
    this.messageChatRequestDto,
    this.chatBoxId,
  });

  ChatApi.fetchChat({int? page, required String userId})
      : this._(
          type: ChatType.fetchChat,
          page: page,
          userId: userId,
        );

  ChatApi.fetchMessageChat({int? page, required String chatBoxId})
      : this._(
          type: ChatType.fetchMessageChat,
          page: page,
          chatBoxId: chatBoxId,
        );

  ChatApi.addChat({
    required ChatRequestDto chatRequestDto,
  }) : this._(
          type: ChatType.addChat,
          chatRequestDto: chatRequestDto,
        );

  ChatApi.addMessageChat({
    required MessageChatRequestDto messageChatRequestDto,
  }) : this._(
          type: ChatType.addMessageChat,
          messageChatRequestDto: messageChatRequestDto,
        );

  @override
  String get endpoint => 'chat';

  @override
  String get path {
    switch (type) {
      case ChatType.fetchChat:
        return '/$userId';
      case ChatType.addChat:
        return '/addChat';
      case ChatType.addMessageChat:
        return '/addMessageChat';
      case ChatType.fetchMessageChat:
        return '/messageChat/$chatBoxId';
    }
  }

  @override
  Map<String, String> get headers {
    return {};
  }

  @override
  Map<String, String>? get query {
    switch (type) {
      case ChatType.fetchChat:
        return {
          'page': '$page',
        };
      case ChatType.addChat:
        return null;
      case ChatType.addMessageChat:
        return null;
      case ChatType.fetchMessageChat:
        return {
          'page': '$page',
        };
    }
  }

  @override
  String? get body {
    switch (type) {
      case ChatType.fetchChat:
        return null;
      case ChatType.addChat:
        return jsonEncode(chatRequestDto?.toJson());
      case ChatType.addMessageChat:
        return jsonEncode(messageChatRequestDto?.toJson());
      case ChatType.fetchMessageChat:
        return null;
    }
  }

  @override
  Future request() {
    switch (type) {
      case ChatType.fetchChat:
        return APIProvider.instance.get(this);
      case ChatType.addChat:
        return APIProvider.instance.post(this);
      case ChatType.addMessageChat:
        return APIProvider.instance.post(this);
      case ChatType.fetchMessageChat:
        return APIProvider.instance.get(this);
    }
  }

  @override
  String get url => endpoint + path;
}
