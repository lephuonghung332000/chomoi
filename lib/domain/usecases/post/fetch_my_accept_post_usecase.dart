import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/post/post_repository_impl.dart';
import 'package:chomoi/domain/models/response/post/post_paging_model.dart';
import 'package:chomoi/domain/repositories/post/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchMyAcceptPostUseCase
    extends ParamUseCase<Either<DioError, PostPagingModel>, String> {
  late final PostRepository _repo;

  FetchMyAcceptPostUseCase({PostRepository? postRepository}) {
    _repo = postRepository ?? PostRepositoryImpl();
  }

  @override
  Future<Either<DioError, PostPagingModel>> call(params) {
    return _repo.fetchPost(
      status: 'accept',
      timePost: null,
      categoryId: null,
      province: null,
      search: null,
      userId: params,
      page: null,
    );
  }
}
