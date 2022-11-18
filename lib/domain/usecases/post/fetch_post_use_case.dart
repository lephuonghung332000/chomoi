import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/post/post_repository_impl.dart';
import 'package:chomoi/domain/models/response/post/post_paging_model.dart';
import 'package:chomoi/domain/repositories/post/post_repository.dart';
import 'package:dartz/dartz.dart';

class FetchPostUseCase extends ParamUseCase<Either<Exception, PostPagingModel>,
    Tuple6<String?, String?, String?, String?, String?, int?>> {
  late final PostRepository _repo;

  FetchPostUseCase({PostRepository? postRepository}) {
    _repo = postRepository ?? PostRepositoryImpl();
  }

  @override
  Future<Either<Exception, PostPagingModel>> call(params) {
    return _repo.fetchPost(
      status: params.value1,
      timePost: params.value2,
      categoryId: params.value3,
      province: params.value4,
      search: params.value5,
      page: params.value6,
    );
  }
}
