import 'package:chomoi/app/core/usecases/no_param_usecase.dart';
import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/post/post_repository_impl.dart';
import 'package:chomoi/domain/models/response/post/post_paging_model.dart';
import 'package:chomoi/domain/repositories/post/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchMyRejectPostUseCase
    extends ParamUseCase<Either<DioError, PostPagingModel>, String> {
  late final PostRepository _repo;

  FetchMyRejectPostUseCase({PostRepository? postRepository}) {
    _repo = postRepository ?? PostRepositoryImpl();
  }

  @override
  Future<Either<DioError, PostPagingModel>> call(params) {
    return _repo.fetchPost(
      status: 'reject',
      timePost: null,
      categoryId: null,
      province: null,
      search: null,
      userId: params,
      page: null,
    );
  }
}
