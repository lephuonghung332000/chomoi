import 'package:chomoi/data/dto/request/auth/login_request_dto.dart';
import 'package:chomoi/data/dto/request/auth/sign_up_request_dto.dart';
import 'package:chomoi/data/dto/response/auth/login_information_dto.dart';
import 'package:chomoi/data/dto/response/auth/refresh_new_token_dto.dart';
import 'package:chomoi/data/dto/response/auth/sign_up_information_dto.dart';
import 'package:chomoi/data/providers/network/apis/auth_api.dart';
import 'package:chomoi/domain/models/request/auth/login_request_model.dart';
import 'package:chomoi/domain/models/request/auth/sign_up_request_model.dart';
import 'package:chomoi/domain/models/response/auth/login_information_model.dart';
import 'package:chomoi/domain/models/response/auth/refresh_new_token_model.dart';
import 'package:chomoi/domain/models/response/auth/sign_up_information_model.dart';
import 'package:chomoi/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Future<Either<DioError, LoginInformationModel>> login(
          LoginRequestModel loginRequestModel) =>
      Task(
        () => AuthAPI.login(LoginRequestDto.fromModel(loginRequestModel))
            .request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (response) => LoginInformationModel.fromDto(
                LoginInformationDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<DioError, RefreshNewTokenModel>> refreshNewToken() => Task(
        () => AuthAPI.refreshToken().request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (response) => RefreshNewTokenModel.fromDto(
                RefreshNewTokenDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<DioError, Unit>> logout() => Task(
        () => AuthAPI.logout().request(),
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

  @override
  Future<Either<DioError, SignUpInformationModel>> signUp(
          SignUpRequestModel signUpRequestModel) =>
      Task(
        () => AuthAPI.signUp(SignUpRequestDto.fromModel(signUpRequestModel))
            .request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (response) => SignUpInformationModel.fromDto(
                SignUpInformationDto.fromJson(response),
              ),
            ),
          )
          .run();
}
