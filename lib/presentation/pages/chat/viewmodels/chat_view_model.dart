import 'package:chomoi/app/util/date_formats.dart';
import 'package:chomoi/domain/models/response/chat/chat_model.dart';
import 'package:chomoi/app/util/double_extension.dart';

class ChatViewModel {
  final String? avatarUrl;
  final String? fullname;
  final String? postTitle;
  final double? createAt;
  final String chatBoxId;
  final String? userId;
  final String postId;

  ChatViewModel({
    this.avatarUrl,
    this.fullname,
    this.postTitle,
    this.createAt,
    this.userId,
    required this.chatBoxId,
    required this.postId,
  });

  String get avatar => avatarUrl ?? '';

  String get time =>
      createAt?.toDateTime
          .localTimeZoneString(DateFormatEnum.hourDayMonthYear) ??
      '';

  String get fullnameChat => fullname ?? '';

  String get postTitleChat => postTitle ?? '';

  String get userIdChat => userId ?? '';

  factory ChatViewModel.fromChat(ChatModel chatModel) {
    return ChatViewModel(
      avatarUrl: chatModel.avatar,
      fullname: chatModel.fullname,
      createAt: chatModel.createAt,
      chatBoxId: chatModel.id,
      postTitle: chatModel.postTitle,
      userId: chatModel.userId,
      postId: chatModel.postId,
    );
  }
}
