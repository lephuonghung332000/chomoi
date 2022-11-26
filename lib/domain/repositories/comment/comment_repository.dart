import 'package:chomoi/domain/models/request/comment/comment_request_model.dart';
import 'package:chomoi/domain/models/response/comment/comment_paging_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CommentRepository {
  Future<Either<DioError, CommentPagingModel>> fetchComment({
    String? postId,
    int? page,
  });

  Future<Either<DioError, Unit>> addComment(
    CommentRequestModel commentRequestModel,
  );
}
