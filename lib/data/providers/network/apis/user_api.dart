import 'package:chomoi/data/dto/request/user/user_request_dto.dart';
import 'package:chomoi/data/providers/network/api_provider.dart';
import 'package:chomoi/data/providers/network/api_request_representable.dart';
import 'package:dio/dio.dart';

enum UserType { fetchUser, updateUser }

class UserAPI implements APIRequestRepresentable {
  final UserType type;
  final String? userId;
  final UserRequestDto? userRequestDto;

  UserAPI._({
    required this.type,
    this.userId,
    this.userRequestDto,
  });

  UserAPI.fetchUser({String? userId})
      : this._(type: UserType.fetchUser, userId: userId);

  UserAPI.updateUser(
      {required UserRequestDto userRequestDto, required String userId})
      : this._(
          type: UserType.updateUser,
          userRequestDto: userRequestDto,
          userId: userId,
        );

  @override
  String get endpoint => 'user';

  @override
  String get path {
    switch (type) {
      case UserType.fetchUser:
        return '/$userId';
      case UserType.updateUser:
        return '/update/$userId';
    }
  }

  @override
  Map<String, String> get headers {
    return {};
  }

  @override
  Map<String, String>? get query => null;

  @override
  dynamic get body {
    switch (type) {
      case UserType.updateUser:
        return FormData.fromMap(userRequestDto!.toJson());
      default:
        return null;
    }
  }

  @override
  Future request() {
    switch (type) {
      case UserType.updateUser:
        return APIProvider.instance.patch(this);
      default:
        return APIProvider.instance.get(this);
    }
  }

  @override
  String get url => endpoint + path;
}
