import 'package:chomoi/app/services/auth_service.dart';
import 'package:chomoi/data/providers/network/api_provider.dart';
import 'package:chomoi/data/providers/network/api_request_representable.dart';

enum UserType { fetchUser }

class UserAPI implements APIRequestRepresentable {
  final UserType type;
  final String? userId;

  UserAPI._({required this.type, this.userId});

  UserAPI.fetchUser({String? userId})
      : this._(type: UserType.fetchUser, userId: userId);

  @override
  String get endpoint => 'user';

  @override
  String get path {
    switch (type) {
      case UserType.fetchUser:
        return userId != null ? '/$userId' : '/';
    }
  }

  @override
  Map<String, String> get headers {
    return {};
  }

  @override
  Map<String, String>? get query => null;

  @override
  Null get body => null;

  @override
  Future request() {
    return APIProvider.instance.get(this);
  }

  @override
  String get url => endpoint + path;
}
