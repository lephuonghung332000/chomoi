import 'package:chomoi/app/util/date_formats.dart';
import 'package:chomoi/domain/models/local/message_chat_local_model.dart';
import 'package:chomoi/domain/models/request/chat/message_chat_request_model.dart';
import 'package:chomoi/app/util/double_extension.dart';

class ContentChatViewModel {
  final String? content;
  final bool? isOwnMessage;
  final double? createAt;

  ContentChatViewModel({this.content, this.isOwnMessage, this.createAt});

  String get timeChat =>
      createAt?.toDateTime.localTimeZoneString(DateFormatEnum.hourMinute24h) ??
      '';

  String get contentChat => content ?? '';

  bool get isOwnMessageChat => isOwnMessage ?? false;

  factory ContentChatViewModel.fromLocal(
      MessageChatLocalModel messageChatLocalModel) {
    return ContentChatViewModel(
      isOwnMessage: messageChatLocalModel.ownMessage,
      content: messageChatLocalModel.content,
      createAt: messageChatLocalModel.createAt,
    );
  }
}
