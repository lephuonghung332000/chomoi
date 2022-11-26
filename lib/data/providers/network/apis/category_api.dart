import 'package:chomoi/app/services/auth_service.dart';
import 'package:chomoi/data/providers/network/api_provider.dart';
import 'package:chomoi/data/providers/network/api_request_representable.dart';

enum CategoryType { fetchCategory }

class CategoryAPI implements APIRequestRepresentable {
  final CategoryType type;

  CategoryAPI._({required this.type});

  CategoryAPI.fetchCategory() : this._(type: CategoryType.fetchCategory);

  @override
  String get endpoint => 'category';

  @override
  String get path {
    switch (type) {
      case CategoryType.fetchCategory:
        return '/';
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
