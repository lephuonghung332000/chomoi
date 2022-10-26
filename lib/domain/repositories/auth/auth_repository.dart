import 'package:chomoi/domain/models/request/auth/login_request_model.dart';
import 'package:chomoi/domain/models/request/auth/sign_up_request_model.dart';
import 'package:chomoi/domain/models/response/auth/login_information_model.dart';
import 'package:chomoi/domain/models/response/auth/logout_information_model.dart';
import 'package:chomoi/domain/models/response/auth/refresh_new_token_model.dart';
import 'package:chomoi/domain/models/response/auth/sign_up_information_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either<Exception, SignUpInformationModel>> signUp(
    SignUpRequestModel signUpRequestModel,
  );

  Future<Either<Exception, LoginInformationModel>> login(
    LoginRequestModel loginRequestModel,
  );

  Future<Either<Exception, RefreshNewTokenModel>> refreshNewToken();

  Future<Either<Exception, LogoutInformationModel>> logout();
}
