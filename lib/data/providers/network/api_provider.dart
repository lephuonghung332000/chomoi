import 'dart:async';
import 'dart:io';
import 'package:chomoi/app/services/auth_service.dart';
import 'package:chomoi/data/providers/network/api_endpoint.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_request_representable.dart';

class APIProvider {
  final Dio _client = createDio();

  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  static Dio createDio() {
    final dio = Dio(BaseOptions(
      baseUrl: APIEndpoint.choMoiApi,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      receiveDataWhenStatusError: true,
    ));

    dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90),
    );

    dio.interceptors.addAll({
      AppInterceptors(),
    });

    return dio;
  }

  Future post(APIRequestRepresentable request) async {
    try {
      final response = await _client.post(
        request.url,
        data: request.body,
        queryParameters: request.query,
        options: Options(headers: request.headers),
      );
      return response.data;
    } on DioError catch (ex) {
      sendError(ex);
    }
  }

  Future patch(APIRequestRepresentable request) async {
    try {
      final response = await _client.patch(
        request.url,
        data: request.body,
        queryParameters: request.query,
        options: Options(headers: request.headers),
      );
      return response.data;
    } on DioError catch (ex) {
      sendError(ex);
    }
  }

  Future get(APIRequestRepresentable request) async {
    try {
      final response = await _client.get(
        request.url,
        queryParameters: request.query,
        options: Options(headers: request.headers),
      );
      return response.data;
    } on DioError catch (ex) {
      sendError(ex);
    }
  }

  Future delete(APIRequestRepresentable request) async {
    try {
      final response = await _client.delete(
        request.url,
        queryParameters: request.query,
        options: Options(headers: request.headers),
      );
      return response.data;
    } on DioError catch (ex) {
      sendError(ex);
    }
  }
}

void sendError(DioError ex) {
  switch (ex.type) {
    case DioErrorType.connectTimeout:
    case DioErrorType.sendTimeout:
    case DioErrorType.receiveTimeout:
      throw DeadlineExceededException(ex.requestOptions);
    case DioErrorType.response:
      switch (ex.response?.statusCode) {
        case 400:
          throw BadRequestException(ex.requestOptions);
        case 404:
          throw NotFoundException(ex.requestOptions);
        case 409:
          throw ConflictException(ex.requestOptions);
        case 500:
        case 502:
          throw InternalServerErrorException(ex.requestOptions);
      }
      break;
    case DioErrorType.cancel:
      break;
    case DioErrorType.other:
      throw NoInternetConnectionException(ex.requestOptions);
  }
}

class AppInterceptors extends QueuedInterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = AuthService.get.accessToken();
    if (token?.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      await handleTokenExpire(err, handler);
    }

    return handler.next(err);
  }
}

Future<void> handleTokenExpire(
  DioError err,
  ErrorInterceptorHandler handler,
) async {
  final dio = Dio();
  final token = AuthService.get.accessToken();

  if (err.requestOptions.headers['Authorization'] != 'Bearer $token') {
    if (token?.isNotEmpty ?? false) {
      err.requestOptions.headers['Authorization'] = 'Bearer $token';
    }

    final response = await dio.fetch(err.requestOptions);
    return handler.resolve(response);
  }

  await AuthService.get.clearToken();
  final success = await AuthService.get.refreshToken();
  if (success) {
    if (token?.isNotEmpty ?? false) {
      err.requestOptions.headers['Authorization'] = 'Bearer $token';
    }

    final response = await dio.fetch(err.requestOptions);
    return handler.resolve(response);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
