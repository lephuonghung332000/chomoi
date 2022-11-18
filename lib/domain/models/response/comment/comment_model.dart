import 'package:chomoi/data/dto/response/comment/comment_paging_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';

@freezed
class CommentModel with _$CommentModel {
  factory CommentModel({
    required String id,
    required String postId,
    required String userId,
    required String content,
    required double createAt,
    required String avatar,
    required String fullname,
  }) = _CommentModel;

  factory CommentModel.empty() => CommentModel(
        id: '',
        postId: '',
        userId: '',
        content: '',
        createAt: -1,
        avatar: '',
        fullname: '',
      );

  static List<CommentModel> fromDto(CommentPagingDto dto) {
    return List<CommentModel>.from(
      dto.data.map<CommentModel>(
        (e) => CommentModel(
          id: e.id,
          postId: e.postId,
          userId: e.userId,
          content: e.content,
          createAt: e.createAt,
          avatar: e.avatar,
          fullname: e.fullname,
        ),
      ),
    );
  }
}
