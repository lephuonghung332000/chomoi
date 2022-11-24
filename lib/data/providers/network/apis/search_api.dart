import 'dart:convert';

import 'package:chomoi/app/services/auth_service..dart';
import 'package:chomoi/data/dto/request/search/search_request_dto.dart';
import 'package:chomoi/data/providers/network/api_endpoint.dart';
import 'package:chomoi/data/providers/network/api_provider.dart';
import 'package:chomoi/data/providers/network/api_request_representable.dart';

enum SearchType { fetchSearch, addSearch }

class SearchApi implements APIRequestRepresentable {
  final SearchType type;
  final SearchRequestDto? searchRequestDto;

  SearchApi._({
    required this.type,
    this.searchRequestDto,
  });

  SearchApi.fetchSearch()
      : this._(
          type: SearchType.fetchSearch,
        );

  SearchApi.addSearch({
    required SearchRequestDto searchRequestDto,
  }) : this._(
          type: SearchType.addSearch,
          searchRequestDto: searchRequestDto,
        );

  @override
  String get endpoint => '${APIEndpoint.choMoiApi}search';

  @override
  String get path {
    switch (type) {
      case SearchType.fetchSearch:
        return '/';
      case SearchType.addSearch:
        return '/addSearch';
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case SearchType.fetchSearch:
        return HTTPMethod.get;
      case SearchType.addSearch:
        return HTTPMethod.post;
    }
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
  String? get body {
    switch (type) {
      case SearchType.addSearch:
        return jsonEncode(searchRequestDto?.toJson());
      case SearchType.fetchSearch:
        return null;
    }
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
