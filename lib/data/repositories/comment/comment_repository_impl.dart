import 'package:chomoi/data/dto/request/comment/comment_request_dto.dart';
import 'package:chomoi/data/dto/response/comment/comment_paging_dto.dart';
import 'package:chomoi/data/providers/network/apis/comment_api.dart';
import 'package:chomoi/domain/models/request/comment/comment_request_model.dart';
import 'package:chomoi/domain/models/response/comment/comment_paging_model.dart';
import 'package:chomoi/domain/repositories/comment/comment_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CommentRepositoryImpl extends CommentRepository {
  @override
  Future<Either<DioError, CommentPagingModel>> fetchComment({
    String? postId,
    int? page,
  }) =>
      Task(
        () => CommentAPI.fetchComment(page: page, postId: postId).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (response) => CommentPagingModel.fromDto(
                CommentPagingDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<DioError, Unit>> addComment(
          CommentRequestModel commentRequestModel) =>
      Task(
        () => CommentAPI.addComment(
          commentRequestDto: CommentRequestDto.fromModel(commentRequestModel),
        ).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (_) => unit,
            ),
          )
          .run();
}
