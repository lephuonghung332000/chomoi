import 'package:chomoi/domain/models/request/post/post_request_model.dart';
import 'package:chomoi/domain/models/response/post/post_paging_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class PostRepository {
  Future<Either<DioError, PostPagingModel>> fetchPost({
    String? status,
    String? timePost,
    String? categoryId,
    String? province,
    String? search,
    int? page,
  });

  Future<Either<DioError, PostPagingModel>> fetchMyPost({
    String? status,
  });

  Future<Either<DioError, Unit>> addPost(
    PostRequestModel postRequestModel,
  );
}
