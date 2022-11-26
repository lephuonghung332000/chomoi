import 'package:chomoi/data/dto/request/post/post_request_dto.dart';
import 'package:chomoi/data/dto/response/post/post_paging_dto.dart';
import 'package:chomoi/data/providers/network/apis/post_api.dart';
import 'package:chomoi/domain/models/request/post/post_request_model.dart';
import 'package:chomoi/domain/models/response/post/post_paging_model.dart';
import 'package:chomoi/domain/repositories/post/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PostRepositoryImpl extends PostRepository {
  @override
  Future<Either<DioError, PostPagingModel>> fetchPost({
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
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (response) => PostPagingModel.fromDto(
                PostPagingDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<DioError, PostPagingModel>> fetchMyPost({String? status}) =>
      Task(
        () => PostAPI.fetchMyPost(
          status: status,
        ).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (response) => PostPagingModel.fromDto(
                PostPagingDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<DioError, Unit>> addPost(
      PostRequestModel postRequestModel) =>
      Task(
            () => PostAPI.addPost(postRequestDto:  PostRequestDto.fromModel(postRequestModel))
            .request(),
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
