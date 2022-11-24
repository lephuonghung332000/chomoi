import 'package:chomoi/app/services/auth_service..dart';
import 'package:chomoi/data/providers/network/api_endpoint.dart';
import 'package:chomoi/data/providers/network/api_provider.dart';
import 'package:chomoi/data/providers/network/api_request_representable.dart';

enum BrandType { fetchBrand }

class BrandAPI implements APIRequestRepresentable {
  final BrandType type;

  BrandAPI._({required this.type});

  BrandAPI.fetchBrand() : this._(type: BrandType.fetchBrand);

  @override
  String get endpoint => '${APIEndpoint.choMoiApi}brand';

  @override
  String get path {
    switch (type) {
      case BrandType.fetchBrand:
        return '/';
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
