import 'package:chomoi/app/services/auth_service..dart';
import 'package:chomoi/data/providers/network/api_endpoint.dart';
import 'package:chomoi/data/providers/network/api_provider.dart';
import 'package:chomoi/data/providers/network/api_request_representable.dart';

enum PostType { fetchPost, fetchMyPost }

class PostAPI implements APIRequestRepresentable {
  final PostType type;
  int? page;
  String? status;
  String? timePost;
  String? categoryId;
  String? province;
  String? search;
  int? userId;

  PostAPI._({
    required this.type,
    this.status,
    this.timePost,
    this.categoryId,
    this.province,
    this.search,
    this.page,
  });

  PostAPI.fetchPost({
    String? status,
    int? page,
    String? timePost,
    String? categoryId,
    String? province,
    String? search,
  }) : this._(
          type: PostType.fetchPost,
          page: page,
          status: status,
          timePost: timePost,
          categoryId: categoryId,
          province: province,
          search: search,
        );

  PostAPI.fetchMyPost({
    String? status,
  }) : this._(
          type: PostType.fetchMyPost,
          status: status,
        );

  @override
  String get endpoint => '${APIEndpoint.choMoiApi}post';

  @override
  String get path {
    switch (type) {
      case PostType.fetchPost:
        return userId != null ? '/$userId' : '';
      case PostType.fetchMyPost:
        return '/currentUser';
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
  Map<String, String>? get query {
    switch (type) {
      case PostType.fetchPost:
        final Map<String, String> queryPost = {
          'page': '$page',
        };
        if (status != null) {
          queryPost['status'] = '$status';
        }
        if (timePost != null) {
          queryPost['create_at'] = '$timePost';
        }
        if (categoryId != null) {
          queryPost['category_id'] = '$categoryId';
        }
        if (province != null) {
          queryPost['province'] = '$province';
        }
        if (search != null) {
          queryPost['search'] = '$search';
        }
        return queryPost;
      case PostType.fetchMyPost:
        final Map<String, String> queryMyPost = {
        };
        if (status != null) {
          queryMyPost['status'] = '$status';
        }
        return queryMyPost;
    }
  }

  @override
  Null get body => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
