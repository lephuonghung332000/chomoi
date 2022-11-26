import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/auth/auth_repository_impl.dart';
import 'package:chomoi/domain/models/request/auth/login_request_model.dart';
import 'package:chomoi/domain/models/response/auth/login_information_model.dart';
import 'package:chomoi/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginUseCase extends ParamUseCase<
    Either<DioError, LoginInformationModel>, LoginRequestModel> {
  late final AuthenticationRepository _repo;

  LoginUseCase({AuthenticationRepository? authRepository}) {
    _repo = authRepository ?? AuthenticationRepositoryImpl();
  }

  @override
  Future<Either<DioError, LoginInformationModel>> call(params) {
    return _repo.login(params);
  }
}
