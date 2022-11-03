import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/post/post_repository_impl.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/domain/repositories/post/post_repository.dart';
import 'package:dartz/dartz.dart';

class FetchPostUseCase
    extends ParamUseCase<Either<Exception, List<PostModel>>,Tuple2<String?,int?>> {
  late final PostRepository _repo;

  FetchPostUseCase({PostRepository? postRepository}) {
    _repo = postRepository ?? PostRepositoryImpl();
  }

  @override
  Future<Either<Exception, List<PostModel>>> call(params) {
    return _repo.fetchPost(status: params.value1,page: params.value2);
  }
}
