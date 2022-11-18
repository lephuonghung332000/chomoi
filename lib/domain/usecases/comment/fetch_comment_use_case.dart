import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/comment/comment_repository_impl.dart';
import 'package:chomoi/data/repositories/post/post_repository_impl.dart';
import 'package:chomoi/domain/models/response/comment/comment_model.dart';
import 'package:chomoi/domain/models/response/comment/comment_paging_model.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/domain/repositories/comment/comment_repository.dart';
import 'package:chomoi/domain/repositories/post/post_repository.dart';
import 'package:dartz/dartz.dart';

class FetchCommentUseCase extends ParamUseCase<
    Either<Exception, CommentPagingModel>, Tuple2<String?, int?>> {
  late final CommentRepository _repo;

  FetchCommentUseCase({CommentRepository? commentRepository}) {
    _repo = commentRepository ?? CommentRepositoryImpl();
  }

  @override
  Future<Either<Exception, CommentPagingModel>> call(params) {
    return _repo.fetchComment(
      postId: params.value1,
      page: params.value2,
    );
  }
}
