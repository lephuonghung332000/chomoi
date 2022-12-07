import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/services/firebase_message_service.dart';
import 'package:chomoi/domain/usecases/auth/logout_use_case.dart';
import 'package:chomoi/domain/usecases/auth/refresh_new_token_use_case.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:chomoi/presentation/widgets/loading_dialog.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

abstract class AuthService {
  static AuthService get get => Get.find<AuthService>();

  String? accessToken();

  Future<void> storeToken(String token);

  Future<void> clearToken();

  bool isLoggedIn();

  Future<void> logout();

  Future<bool> refreshToken();
}

class AuthServiceImpl extends GetxService implements AuthService {
  AuthServiceImpl({
    LogoutUseCase? logoutUseCase,
    RefreshNewTokenUseCase? refreshNewTokenUseCase,
  }) {
    this.logoutUseCase = logoutUseCase ?? LogoutUseCase();
    this.refreshNewTokenUseCase =
        refreshNewTokenUseCase ?? RefreshNewTokenUseCase();
  }

  late final LogoutUseCase logoutUseCase;
  late final RefreshNewTokenUseCase refreshNewTokenUseCase;

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
    _accessToken = token;
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
    final result = await logoutUseCase.call();
    result.fold(
      (e) {},
      (_) {
        FirebaseMessageService.get.removeFCMTokenFromServer();
        Future<void>.delayed(const Duration(milliseconds: 1500), () {
          Get.offAllNamed(AppPages.loginPage.name);
        });
      },
    );
  }

  @override
  Future<bool> refreshToken() async {
    LoadingDialog.show();
    final result = await refreshNewTokenUseCase.call();
    bool isSuccess = false;
    result.fold(
      (e) async {
        await LoadingDialog.hide();
        FirebaseMessageService.get.removeFCMTokenFromServer();
        Future<void>.delayed(const Duration(milliseconds: 1500), () {
          Get.offAllNamed(AppPages.loginPage.name);
        });
      },
      (value) async {
        await LoadingDialog.hide();

        isSuccess = true;
        storeToken(value.idToken);
      },
    );
    return isSuccess;
  }
}
