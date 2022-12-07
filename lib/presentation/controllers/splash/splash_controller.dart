import 'package:chomoi/app/services/auth_service.dart';
import 'package:chomoi/app/services/firebase_message_service.dart';
import 'package:chomoi/domain/usecases/auth/refresh_new_token_use_case.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final RefreshNewTokenUseCase refreshNewTokenUseCase;

  SplashController({required this.refreshNewTokenUseCase});

  @override
  void onInit() {
    FocusManager.instance.primaryFocus?.unfocus();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    _checkAuth();
    super.onReady();
  }

  void _checkAuth() {
    if (AuthService.get.accessToken() != null) {
      _refreshToken();
    } else {
      _routeToLogin();
    }
  }

  Future<void> _refreshToken() async {
    final result = await refreshNewTokenUseCase.call();
    result.fold(
      (e) {
        FirebaseMessageService.get.removeFCMTokenFromServer();
        _routeToLogin(isRemovedToken: true);
      },
      (value) {
        AuthService.get.storeToken(value.idToken);
        _routeToMain();
      },
    );
  }

  void _routeToMain() {
    const animationDuration = Duration(milliseconds: 500);
    Future.delayed(
      animationDuration,
    ).then(
      (value) => Get.offAllNamed(AppPages.mainPage.name),
    );
  }

  Future<void> _routeToLogin({bool isRemovedToken = false}) async {
    if (isRemovedToken) {
      await AuthService.get.clearToken();
    }
    Future<void>.delayed(const Duration(milliseconds: 1500), () {
      Get.offAllNamed(AppPages.loginPage.name);
    });
  }
}
