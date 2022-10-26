import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/services/auth_service..dart';
import 'package:chomoi/app/util/get_cupertino_dialog.dart';
import 'package:chomoi/domain/models/request/auth/login_request_model.dart';
import 'package:chomoi/domain/models/response/auth/login_information_model.dart';
import 'package:chomoi/domain/models/states.dart';
import 'package:chomoi/domain/usecases/auth/login_use_case.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController({required this.loginUseCase});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  final _isValidForm = false.obs;
  final _loginState = States<LoginInformationModel>.init(
    entity: LoginInformationModel.empty(),
  ).obs;

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  bool get isValidForm => _isValidForm.value;

  States<LoginInformationModel> get loginState => _loginState.value;

  void onValidForm() {
    _isValidForm.value = loginFormKey.currentState!.validate() &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  void routeToSingUpPage() {
    Get.toNamed(AppPages.signUpPage.name);
  }

  Future<void> login() async {
    FocusManager.instance.primaryFocus?.unfocus();
    _loginState.value = const States.loading();
    final result = await loginUseCase.call(
      LoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold((failure) {
      _loginState.value = States.failure(failure);
      Get.cupertinoDialog(
        title: AppStrings.error_title,
        middleText: failure.toString(),
        onConfirm: () => Get.back(),
        barrierDismissible: false,
      );
    }, (value) {
      _loginState.value = States.success(entity: value);
      AuthService.get.storeToken(value.idToken);
      _routeToMain();
    });
  }

  void _routeToMain() {
    const animationDuration = Duration(milliseconds: 500);
    Future.delayed(
      animationDuration,
    ).then(
      (value) => Get.offAllNamed(AppPages.mainPage.name),
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
