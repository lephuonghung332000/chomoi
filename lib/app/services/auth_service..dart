import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/domain/usecases/auth/logout_use_case.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

abstract class AuthService {
  static AuthService get get => Get.find<AuthService>();

  String? accessToken();

  Future<void> storeToken(String token);

  Future<void> clearToken();

  bool isLoggedIn();

  Future<void> logout();
}

class AuthServiceImpl extends GetxService implements AuthService {
  AuthServiceImpl({
    LogoutUseCase? logoutUseCase,
  }) {
    this.logoutUseCase = logoutUseCase ?? LogoutUseCase();
  }

  late final LogoutUseCase logoutUseCase;

  final _storage = const FlutterSecureStorage();
  String? _accessToken;

  Future<AuthService> init() async {
    _accessToken = await getToken();
    return this;
  }

  Future<String?> getToken() async {
    return _storage.read(key: AppStrings.token);
  }

  @override
  Future<void> clearToken() async {
    _accessToken = null;
    await storeToken(null);
  }

  @override
  Future<void> storeToken(String? token) async {
    return _storage.write(
      key: AppStrings.token,
      value: token,
    );
  }

  @override
  String? accessToken() {
    return _accessToken;
  }

  @override
  bool isLoggedIn() {
    return _accessToken != null;
  }

  @override
  Future<void> logout() async {
    await clearToken();
    final result = await logoutUseCase.call();
    result.fold(
      (e) {},
      (_) {
        Future<void>.delayed(const Duration(milliseconds: 1500), () {
          Get.offAllNamed(AppPages.loginPage.name);
        });
      },
    );
  }
}