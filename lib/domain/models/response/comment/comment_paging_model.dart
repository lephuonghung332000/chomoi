import 'package:chomoi/data/dto/response/comment/comment_paging_dto.dart';
import 'package:chomoi/domain/models/response/comment/comment_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_paging_model.freezed.dart';

@freezed
class CommentPagingModel with _$CommentPagingModel {
  factory CommentPagingModel({
    required int total,
    required List<CommentModel> comments,
  }) = _CommentPagingModel;

  factory CommentPagingModel.empty() => CommentPagingModel(
        total: -1,
    comments: [],
      );

  factory CommentPagingModel.fromDto(CommentPagingDto dto) {
    return CommentPagingModel(
      comments: CommentModel.fromDto(
        dto,
      ),
      total: dto.total,
    );
  }
}
