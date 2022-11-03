import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/user/user_repository_impl.dart';
import 'package:chomoi/domain/models/response/user/user_model.dart';
import 'package:chomoi/domain/repositories/user/user_repository.dart';
import 'package:dartz/dartz.dart';

class FetchUserUseCase
    extends ParamUseCase<Either<Exception, UserModel>, String?> {
  late final UserRepository _repo;

  FetchUserUseCase({UserRepository? userRepository}) {
    _repo = userRepository ?? UserRepositoryImpl();
  }

  @override
  Future<Either<Exception, UserModel>> call(params) {
    return _repo.fetchUser(userId: params);
  }
}
