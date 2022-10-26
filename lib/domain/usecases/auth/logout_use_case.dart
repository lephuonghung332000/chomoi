import 'package:chomoi/app/core/usecases/no_param_usecase.dart';
import 'package:chomoi/data/repositories/auth/auth_repository_impl.dart';
import 'package:chomoi/domain/models/response/auth/logout_information_model.dart';
import 'package:chomoi/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase
    extends NoParamUseCase<Either<Exception, LogoutInformationModel>> {
  late final AuthenticationRepository _repo;

  LogoutUseCase({AuthenticationRepository? authRepository}) {
    _repo = authRepository ?? AuthenticationRepositoryImpl();
  }

  @override
  Future<Either<Exception, LogoutInformationModel>> call() {
    return _repo.logout();
  }
}
