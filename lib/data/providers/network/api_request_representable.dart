abstract class APIRequestRepresentable {
  String get endpoint;
  String get path;
  String get url;
  Map<String, String>? get headers;
  Map<String, String>? get query;
  dynamic get body;
  Future request();
}
