import 'package:chomoi/app/core/usecases/no_param_usecase.dart';
import 'package:chomoi/data/repositories/post/post_repository_impl.dart';
import 'package:chomoi/domain/models/response/post/post_paging_model.dart';
import 'package:chomoi/domain/repositories/post/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchMyRejectPostUseCase
    extends NoParamUseCase<Either<DioError, PostPagingModel>> {
  late final PostRepository _repo;

  FetchMyRejectPostUseCase({PostRepository? postRepository}) {
    _repo = postRepository ?? PostRepositoryImpl();
  }

  @override
  Future<Either<DioError, PostPagingModel>> call() {
    return _repo.fetchMyPost(status: 'reject');
  }
}
