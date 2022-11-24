import 'package:chomoi/domain/models/request/post/post_request_model.dart';
import 'package:chomoi/domain/models/response/post/post_paging_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Exception, PostPagingModel>> fetchPost({
    String? status,
    String? timePost,
    String? categoryId,
    String? province,
    String? search,
    int? page,
  });

  Future<Either<Exception, PostPagingModel>> fetchMyPost({
    String? status,
  });

  Future<Either<Exception, Unit>> addPost(
    PostRequestModel postRequestModel,
  );
}
