import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_request_model.freezed.dart';

@freezed
class CommentRequestModel with _$CommentRequestModel {
  factory CommentRequestModel({
    required String postId,
    required String userId,
    required String content,
  }) = _CommentRequestModel;

  factory CommentRequestModel.empty() => CommentRequestModel(
        postId: '',
        userId: '',
        content: '',
      );
}
