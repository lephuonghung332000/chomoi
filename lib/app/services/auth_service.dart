import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/services/firebase_message_service.dart';
import 'package:chomoi/app/services/socket_service.dart';
import 'package:chomoi/domain/usecases/auth/logout_use_case.dart';
import 'package:chomoi/domain/usecases/auth/refresh_new_token_use_case.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:chomoi/presentation/widgets/loading_dialog.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

abstract class AuthService {
  static AuthService get get => Get.find<AuthService>();

  String? accessToken();

  String? getCurrentUserId();

  Future<void> storeUserId(String userId);

  Future<void> storeToken(String token);

  Future<void> clearToken();

  Future<void> clearUserId();

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

  String? _userId;

  Future<AuthService> init() async {
    _accessToken = await getToken();
    _userId = await getUserId();
    return this;
  }

  Future<String?> getToken() async {
    return _storage.read(key: AppStrings.token);
  }

  Future<String?> getUserId() async {
    return _storage.read(key: AppStrings.user_id);
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
    final id = _userId;
    if (id == null) {
      return;
    }
    await logoutUseCase.call(id);
    SocketService.get.dispose();
    clearToken();
    clearUserId();
    FirebaseMessageService.get.removeFCMTokenFromServer();
    Future<void>.delayed(const Duration(milliseconds: 1500), () {
      Get.offAllNamed(AppPages.loginPage.name);
    });
  }

  @override
  Future<bool> refreshToken() async {
    LoadingDialog.show();
    final id = _userId;
    if (id != null) {
      final result = await refreshNewTokenUseCase.call(id);
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
    return false;
  }

  @override
  Future<void> clearUserId() async {
    _userId = null;
    await storeUserId(null);
  }

  @override
  String? getCurrentUserId() {
    return _userId;
  }

  @override
  Future<void> storeUserId(String? userId) {
    _userId = userId;
    return _storage.write(
      key: AppStrings.user_id,
      value: userId,
    );
  }
}
