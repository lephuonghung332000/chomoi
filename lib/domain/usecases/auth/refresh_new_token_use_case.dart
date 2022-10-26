import 'package:chomoi/app/core/usecases/no_param_usecase.dart';
import 'package:chomoi/data/repositories/auth/auth_repository_impl.dart';
import 'package:chomoi/domain/models/response/auth/refresh_new_token_model.dart';
import 'package:chomoi/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RefreshNewTokenUseCase
    extends NoParamUseCase<Either<Exception, RefreshNewTokenModel>> {
  late final AuthenticationRepository _repo;

  RefreshNewTokenUseCase({AuthenticationRepository? authRepository}) {
    _repo = authRepository ?? AuthenticationRepositoryImpl();
  }

  @override
  Future<Either<Exception, RefreshNewTokenModel>> call() {
    return _repo.refreshNewToken();
  }
}
