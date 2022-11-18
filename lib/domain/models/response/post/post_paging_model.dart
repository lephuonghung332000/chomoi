import 'package:chomoi/data/dto/response/post/post_paging_dto.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_paging_model.freezed.dart';

@freezed
class PostPagingModel with _$PostPagingModel {
  factory PostPagingModel({
    required int total,
    required List<PostModel> posts,
  }) = _PostPagingModel;

  factory PostPagingModel.empty() => PostPagingModel(
        total: -1,
    posts: [],
      );

  factory PostPagingModel.fromDto(PostPagingDto dto) {
    return PostPagingModel(
      posts: PostModel.fromDto(
        dto,
      ),
      total: dto.total,
    );
  }
}
