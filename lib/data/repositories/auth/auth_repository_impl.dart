import 'package:chomoi/data/dto/request/auth/login_request_dto.dart';
import 'package:chomoi/data/dto/request/auth/sign_up_request_dto.dart';
import 'package:chomoi/data/dto/response/auth/login_information_dto.dart';
import 'package:chomoi/data/dto/response/auth/logout_information_dto.dart';
import 'package:chomoi/data/dto/response/auth/refresh_new_token_dto.dart';
import 'package:chomoi/data/dto/response/auth/sign_up_information_dto.dart';
import 'package:chomoi/data/providers/network/apis/auth_api.dart';
import 'package:chomoi/domain/models/request/auth/login_request_model.dart';
import 'package:chomoi/domain/models/request/auth/sign_up_request_model.dart';
import 'package:chomoi/domain/models/response/auth/login_information_model.dart';
import 'package:chomoi/domain/models/response/auth/logout_information_model.dart';
import 'package:chomoi/domain/models/response/auth/refresh_new_token_model.dart';
import 'package:chomoi/domain/models/response/auth/sign_up_information_model.dart';
import 'package:chomoi/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Future<Either<Exception, LoginInformationModel>> login(
          LoginRequestModel loginRequestModel) =>
      Task(
        () => AuthAPI.login(LoginRequestDto.fromModel(loginRequestModel))
            .request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (response) => LoginInformationModel.fromDto(
                LoginInformationDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<Exception, RefreshNewTokenModel>> refreshNewToken() => Task(
        () => AuthAPI.refreshToken().request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (response) => RefreshNewTokenModel.fromDto(
                RefreshNewTokenDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<Exception, LogoutInformationModel>> logout() => Task(
        () => AuthAPI.logout().request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (response) => LogoutInformationModel.fromDto(
                LogoutInformationDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<Exception, SignUpInformationModel>> signUp(
          SignUpRequestModel signUpRequestModel) =>
      Task(
        () => AuthAPI.signUp(SignUpRequestDto.fromModel(signUpRequestModel))
            .request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (response) => SignUpInformationModel.fromDto(
                SignUpInformationDto.fromJson(response),
              ),
            ),
          )
          .run();
}
