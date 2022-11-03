import 'package:chomoi/app/services/auth_service..dart';
import 'package:chomoi/data/providers/network/api_endpoint.dart';
import 'package:chomoi/data/providers/network/api_provider.dart';
import 'package:chomoi/data/providers/network/api_request_representable.dart';

enum AdsType { fetchAds }

class AdsAPI implements APIRequestRepresentable {
  final AdsType type;

  AdsAPI._({required this.type});

  AdsAPI.fetchAds() : this._(type: AdsType.fetchAds);

  @override
  String get endpoint => '${APIEndpoint.choMoiApi}ads';

  @override
  String get path {
    switch (type) {
      case AdsType.fetchAds:
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
