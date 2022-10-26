import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LocalStorageService extends GetxService {
  final _storage = const FlutterSecureStorage();
  String? _accessToken;

  Future<LocalStorageService> init() async {
    _accessToken = await getToken();
    return this;
  }

  Future<String?> getToken() async {
    return _storage.read(key: AppStrings.token);
  }

  Future<void> _clearToken() async {
    _accessToken = null;
    await storeToken(null);
  }

  Future<void> storeToken(String? token) async {
    return _storage.write(
      key: AppStrings.token,
      value: token,
    );
  }

  void _stopServices() {
  }
}
