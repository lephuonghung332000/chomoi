import 'package:chomoi/domain/models/request/user/user_request_model.dart';
import 'package:chomoi/domain/models/response/user/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class UserRepository {
  Future<Either<DioError, UserModel>> fetchUser({
    String? userId,
  });

  Future<Either<DioError, Unit>> updateUser({
    required UserRequestModel userRequestModel,
  });
}
