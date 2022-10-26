import 'package:chomoi/data/providers/network/api_endpoint.dart';
import 'package:chomoi/data/providers/network/api_provider.dart';
import 'package:chomoi/data/providers/network/api_request_representable.dart';

enum CountryType { fetchProvince, fetchDistrict, fetchWard }

class CountryAPI implements APIRequestRepresentable {
  final CountryType type;
  int? provinceId;
  int? districtId;

  CountryAPI._({required this.type, this.provinceId, this.districtId});

  CountryAPI.fetchProvince() : this._(type: CountryType.fetchProvince);

  CountryAPI.fetchDistrict(int provinceId)
      : this._(
    type: CountryType.fetchDistrict,
    provinceId: provinceId,
  );

  CountryAPI.fetchWard(int districtId)
      : this._(
    type: CountryType.fetchWard,
    districtId: districtId,
  );

  @override
  String get endpoint => '${APIEndpoint.countryApi}province';

  @override
  String get path {
    switch (type) {
      case CountryType.fetchProvince:
        return '/';
      case CountryType.fetchDistrict:
        return '/district/$provinceId';
      case CountryType.fetchWard:
        return '/ward/$districtId';
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  Map<String, String>? get headers => null;

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
