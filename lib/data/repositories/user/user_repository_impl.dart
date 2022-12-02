import 'package:chomoi/data/dto/request/user/user_request_dto.dart';
import 'package:chomoi/data/dto/response/user/user_dto.dart';
import 'package:chomoi/data/providers/network/apis/user_api.dart';
import 'package:chomoi/domain/models/request/user/user_request_model.dart';
import 'package:chomoi/domain/models/response/user/user_model.dart';
import 'package:chomoi/domain/repositories/user/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<Either<DioError, UserModel>> fetchUser({
    String? userId,
  }) =>
      Task(
        () => UserAPI.fetchUser(userId: userId).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (response) => UserModel.fromDto(
                UserDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<DioError, Unit>> updateUser(
          {required UserRequestModel userRequestModel}) =>
      Task(
        () => UserAPI.updateUser(
          userRequestDto: UserRequestDto.fromModel(userRequestModel),
        ).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (_) => unit,
            ),
          )
          .run();
}
