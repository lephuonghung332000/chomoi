import 'package:chomoi/app/services/auth_service..dart';
import 'package:chomoi/data/providers/network/api_endpoint.dart';
import 'package:chomoi/data/providers/network/api_provider.dart';
import 'package:chomoi/data/providers/network/api_request_representable.dart';

enum PostType { fetchPost }

class PostAPI implements APIRequestRepresentable {
  final PostType type;
  int? page;
  String? status;
  int? userId;

  PostAPI._({required this.type, this.page, this.status});

  PostAPI.fetchPost({
    String? status,
    int? page,
  }) : this._(type: PostType.fetchPost, page: page, status: status);

  @override
  String get endpoint => '${APIEndpoint.choMoiApi}post';

  @override
  String get path {
    switch (type) {
      case PostType.fetchPost:
        return userId != null ? '/$userId' : '/';
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  Map<String, String> get headers {
    final token = AuthService.get.accessToken();
    if (token != null) {
      return {
        'Authorization': 'Bearer $token',
      };
    }
    return {};
  }

  @override
  Map<String, String>? get query => null;

  @override
  Null get body => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
