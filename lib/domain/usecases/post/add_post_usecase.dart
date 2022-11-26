import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/post/post_repository_impl.dart';
import 'package:chomoi/domain/models/request/post/post_request_model.dart';
import 'package:chomoi/domain/repositories/post/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AddPostUseCase extends ParamUseCase<
    Either<DioError, Unit>, PostRequestModel> {
  late final PostRepository _repo;

  AddPostUseCase({PostRepository? postRepository}) {
    _repo = postRepository ?? PostRepositoryImpl();
  }

  @override
  Future<Either<DioError, Unit>> call(params) {
    return _repo.addPost(params);
  }
}
