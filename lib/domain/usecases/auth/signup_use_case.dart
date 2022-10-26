import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/auth/auth_repository_impl.dart';
import 'package:chomoi/domain/models/request/auth/sign_up_request_model.dart';
import 'package:chomoi/domain/models/response/auth/sign_up_information_model.dart';
import 'package:chomoi/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpUseCase extends ParamUseCase<
    Either<Exception, SignUpInformationModel>, SignUpRequestModel> {
  late final AuthenticationRepository _repo;

  SignUpUseCase({AuthenticationRepository? authRepository}) {
    _repo = authRepository ?? AuthenticationRepositoryImpl();
  }

  @override
  Future<Either<Exception, SignUpInformationModel>> call(
    SignUpRequestModel params,
  ) {
    return _repo.signUp(params);
  }
}
