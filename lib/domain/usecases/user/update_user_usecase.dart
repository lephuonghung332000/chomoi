import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/post/post_repository_impl.dart';
import 'package:chomoi/data/repositories/user/user_repository_impl.dart';
import 'package:chomoi/domain/models/request/post/post_request_model.dart';
import 'package:chomoi/domain/models/request/user/user_request_model.dart';
import 'package:chomoi/domain/repositories/post/post_repository.dart';
import 'package:chomoi/domain/repositories/user/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UpdateUserUseCase extends ParamUseCase<Either<DioError, Unit>,
    Tuple2<UserRequestModel, String>> {
  late final UserRepository _repo;

  UpdateUserUseCase({UserRepository? userRepository}) {
    _repo = userRepository ?? UserRepositoryImpl();
  }

  @override
  Future<Either<DioError, Unit>> call(params) {
    return _repo.updateUser(
      userRequestModel: params.value1,
      userId: params.value2,
    );
  }
}
