import 'package:chomoi/app/util/date_time_extensions.dart';
import 'package:chomoi/domain/models/response/comment/comment_model.dart';
import 'package:chomoi/app/util/double_extension.dart';
import 'package:chomoi/domain/models/response/user/user_model.dart';

class CommentViewModel {
  final String? avatarUrl;
  final String? fullname;
  final String? content;
  final double? createAt;
  final String? avatarCurrentUser;

  CommentViewModel(
      {this.avatarUrl, this.fullname, this.content, this.createAt,this.avatarCurrentUser});

  String get avatar => avatarUrl ?? '';

  String get myAvatar => avatarCurrentUser ?? '';

  String get timeAgo => createAt?.toDateTime.timeAgo ?? '';

  String get name => fullname ?? '';

  String get contentComment => content ?? '';

  factory CommentViewModel.fromComment(CommentModel commentModel) {
    return CommentViewModel(
      avatarUrl: commentModel.avatar,
      fullname: commentModel.fullname,
      createAt: commentModel.createAt,
      content: commentModel.content,
    );
  }

  factory CommentViewModel.fromCurrentUser(UserModel userModel) {
    return CommentViewModel(
      avatarCurrentUser: userModel.avatar
    );
  }
}
