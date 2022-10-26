import 'package:chomoi/app/services/auth_service..dart';
import 'package:chomoi/data/providers/network/api_endpoint.dart';
import 'package:chomoi/data/providers/network/api_provider.dart';
import 'package:chomoi/data/providers/network/api_request_representable.dart';

enum ArticleType { fetchHeadline, fetchNews }

class ArticleAPI implements APIRequestRepresentable {
  final ArticleType type;
  String? keyword;
  int? page;
  int? pageSize;

  ArticleAPI._({required this.type, this.keyword, this.page, this.pageSize});

  ArticleAPI.fetchHeadline(int page, int pageSize)
      : this._(type: ArticleType.fetchHeadline, page: page, pageSize: pageSize);

  ArticleAPI.fetchNews(String keyword, int page, int pageSize)
      : this._(
      type: ArticleType.fetchNews,
      keyword: keyword,
      page: page,
      pageSize: pageSize);

  @override
  String get endpoint => APIEndpoint.choMoiApi;

  @override
  String get path {
    switch (type) {
      case ArticleType.fetchHeadline:
        return '/top-headlines';
      case ArticleType.fetchNews:
        return '/top-headlines';
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
      return {'Authorization': 'Bearer $token}'};
    }
    return {};
  }

  @override
  Map<String, String> get query {
    switch (type) {
      case ArticleType.fetchHeadline:
        return {'country': 'us', 'page': '$page', 'pageSize': '$pageSize'};
      case ArticleType.fetchNews:
        return {'page': '$page', 'pageSize': '$pageSize', 'q': keyword ?? ''};
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
