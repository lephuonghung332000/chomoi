import 'package:chomoi/app/core/usecases/no_param_usecase.dart';
import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/auth/auth_repository_impl.dart';
import 'package:chomoi/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LogoutUseCase
    extends ParamUseCase<Either<DioError, Unit>,String> {
  late final AuthenticationRepository _repo;

  LogoutUseCase({AuthenticationRepository? authRepository}) {
    _repo = authRepository ?? AuthenticationRepositoryImpl();
  }

  @override
  Future<Either<DioError, Unit>> call(params) {
    return _repo.logout(userId: params);
  }
}
