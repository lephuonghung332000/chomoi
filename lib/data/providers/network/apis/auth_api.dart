import 'dart:convert';
import 'dart:io';
import 'package:chomoi/data/dto/request/auth/login_request_dto.dart';
import 'package:chomoi/data/dto/request/auth/sign_up_request_dto.dart';

import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

enum AuthType { signUp, login, refreshToken, logout }

class AuthAPI implements APIRequestRepresentable {
  final AuthType type;
  final LoginRequestDto? loginRequestDTO;
  final SignUpRequestDto? signUpRequestDto;
  final String? userId;

  AuthAPI._(
      {required this.type,
      this.loginRequestDTO,
      this.signUpRequestDto,
      this.userId});

  AuthAPI.login(LoginRequestDto loginRequestDTO)
      : this._(type: AuthType.login, loginRequestDTO: loginRequestDTO);

  AuthAPI.refreshToken({required String userId})
      : this._(
          type: AuthType.refreshToken,
          userId: userId,
        );

  AuthAPI.signUp(SignUpRequestDto signUpRequestDto)
      : this._(type: AuthType.signUp, signUpRequestDto: signUpRequestDto);

  AuthAPI.logout({required String userId})
      : this._(
          type: AuthType.logout,
          userId: userId,
        );

  @override
  String get endpoint => 'auth';

  @override
  String get path {
    switch (type) {
      case AuthType.signUp:
        return '/signup';
      case AuthType.login:
        return '/login';
      case AuthType.logout:
        return '/logout/$userId';
      case AuthType.refreshToken:
        return '/refreshToken/$userId';
    }
  }

  @override
  Map<String, String> get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  Map<String, String>? get query => null;

  @override
  String? get body {
    switch (type) {
      case AuthType.signUp:
        return jsonEncode(signUpRequestDto?.toJson());
      case AuthType.login:
        return jsonEncode(loginRequestDTO!.toJson());
      default:
        return null;
    }
  }

  @override
  Future request() {
    if (type == AuthType.refreshToken) {
      return APIProvider().post(this);
    }
    return APIProvider.instance.post(this);
  }

  @override
  String get url => endpoint + path;
}
