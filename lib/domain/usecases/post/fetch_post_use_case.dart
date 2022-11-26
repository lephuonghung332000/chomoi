import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/post/post_repository_impl.dart';
import 'package:chomoi/domain/models/response/post/post_paging_model.dart';
import 'package:chomoi/domain/repositories/post/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchPostUseCase extends ParamUseCase<Either<DioError, PostPagingModel>,
    Tuple5< String?, String?, String?, String?, int?>> {
  late final PostRepository _repo;

  FetchPostUseCase({PostRepository? postRepository}) {
    _repo = postRepository ?? PostRepositoryImpl();
  }

  @override
  Future<Either<DioError, PostPagingModel>> call(params) {
    return _repo.fetchPost(
      status: 'accept',
      timePost: params.value1,
      categoryId: params.value2,
      province: params.value3,
      search: params.value4,
      page: params.value5,
    );
  }
}
