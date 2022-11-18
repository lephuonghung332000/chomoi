import 'package:chomoi/domain/models/request/comment/comment_request_model.dart';
import 'package:chomoi/domain/models/response/comment/comment_paging_model.dart';
import 'package:dartz/dartz.dart';

abstract class CommentRepository {
  Future<Either<Exception, CommentPagingModel>> fetchComment({
    String? postId,
    int? page,
  });

  Future<Either<Exception, Unit>> addComment(
    CommentRequestModel commentRequestModel,
  );
}
