import 'package:chomoi/data/dto/request/post/post_request_dto.dart';
import 'package:chomoi/data/dto/response/post/post_paging_dto.dart';
import 'package:chomoi/data/providers/network/apis/post_api.dart';
import 'package:chomoi/domain/models/request/post/post_request_model.dart';
import 'package:chomoi/domain/models/response/post/post_paging_model.dart';
import 'package:chomoi/domain/repositories/post/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl extends PostRepository {
  @override
  Future<Either<Exception, PostPagingModel>> fetchPost({
    String? status,
    String? timePost,
    String? categoryId,
    String? province,
    String? search,
    int? page,
  }) =>
      Task(
        () => PostAPI.fetchPost(
                status: status,
                page: page,
                timePost: timePost,
                province: province,
                search: search,
                categoryId: categoryId)
            .request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (response) => PostPagingModel.fromDto(
                PostPagingDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<Exception, PostPagingModel>> fetchMyPost({String? status}) =>
      Task(
        () => PostAPI.fetchMyPost(
          status: status,
        ).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (response) => PostPagingModel.fromDto(
                PostPagingDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<Exception, Unit>> addPost(
      PostRequestModel postRequestModel) =>
      Task(
            () => PostAPI.addPost(postRequestDto:  PostRequestDto.fromModel(postRequestModel))
            .request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
            return l as Exception;
          },
        ).map(
              (_) => unit,
        ),
      )
          .run();
}
