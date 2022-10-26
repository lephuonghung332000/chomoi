import 'package:chomoi/presentation/controllers/home/home_binding.dart';
import 'package:chomoi/presentation/controllers/login/login_binding.dart';
import 'package:chomoi/presentation/controllers/main/main_binding.dart';
import 'package:chomoi/presentation/controllers/sign_up/sign_up_binding.dart';
import 'package:chomoi/presentation/controllers/splash/splash_binding.dart';
import 'package:chomoi/presentation/pages/home/home_page.dart';
import 'package:chomoi/presentation/pages/login/login_page.dart';
import 'package:chomoi/presentation/pages/main/main_page.dart';
import 'package:chomoi/presentation/pages/sign_up/sign_up_page.dart';
import 'package:chomoi/presentation/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    loginPage,
    mainPage,
    signUpPage,
    splashPage,
  ].map((e) => e.page).toList();

  final GetPage page;
  final String name;

  AppPages({required this.name, required this.page});

  static final splashPage = AppPages(
    name: _AppRoutes.splash,
    page: GetPage(
      name: _AppRoutes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
      transition: Transition.noTransition,
    ),
  );

  static final mainPage = AppPages(
    name: _AppRoutes.main,
    page: GetPage(
      name: _AppRoutes.main,
      page: () => MainPage(),
      binding: MainBinding(),
      transition: Transition.fadeIn,
    ),
  );

  static final loginPage = AppPages(
    name: _AppRoutes.login,
    page: GetPage(
      name: _AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350),
    ),
  );
  static final signUpPage = AppPages(
    name: _AppRoutes.signUp,
    page: GetPage(
      name: _AppRoutes.signUp,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 700),
    ),
  );

  static final homePage = AppPages(
    name: _AppRoutes.home,
    page: GetPage(
      name: _AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
  );
}

abstract class _AppRoutes {
  static const home = '/home';
  static const login = '/login';
  static const main = '/main';
  static const signUp = '/signUp';
  static const splash = '/splash';
}
