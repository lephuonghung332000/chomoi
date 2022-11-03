import 'package:chomoi/presentation/controllers/home_tab/home/home_binding.dart';
import 'package:chomoi/presentation/controllers/home_tab/search/search_binding.dart';
import 'package:chomoi/presentation/controllers/login/login_binding.dart';
import 'package:chomoi/presentation/controllers/main/main_binding.dart';
import 'package:chomoi/presentation/controllers/notification_tab/notification_binding.dart';
import 'package:chomoi/presentation/controllers/post_tab/post_binding.dart';
import 'package:chomoi/presentation/controllers/setting_tab/setting_binding.dart';
import 'package:chomoi/presentation/controllers/sign_up/sign_up_binding.dart';
import 'package:chomoi/presentation/controllers/splash/splash_binding.dart';
import 'package:chomoi/presentation/pages/home_tab/home/home_page.dart';
import 'package:chomoi/presentation/pages/home_tab/search/search_page.dart';
import 'package:chomoi/presentation/pages/login/login_page.dart';
import 'package:chomoi/presentation/pages/main/main_page.dart';
import 'package:chomoi/presentation/pages/notification_tab/notification_page.dart';
import 'package:chomoi/presentation/pages/post_tab/post_page.dart';
import 'package:chomoi/presentation/pages/setting_tab/setting_page.dart';
import 'package:chomoi/presentation/pages/sign_up/sign_up_page.dart';
import 'package:chomoi/presentation/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    homePage,
    loginPage,
    mainPage,
    notificationPage,
    postPage,
    signUpPage,
    splashPage,
    searchPage,
    settingPage,
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
  static final postPage = AppPages(
    name: _AppRoutes.post,
    page: GetPage(
      name: _AppRoutes.post,
      page: () => PostPage(),
      binding: PostBinding(),
      transition: Transition.noTransition,
    ),
  );
  static final notificationPage = AppPages(
    name: _AppRoutes.notification,
    page: GetPage(
      name: _AppRoutes.notification,
      page: () => NotificationPage(),
      binding: NotificationBinding(),
      transition: Transition.noTransition,
    ),
  );
  static final settingPage = AppPages(
    name: _AppRoutes.setting,
    page: GetPage(
      name: _AppRoutes.setting,
      page: () => SettingPage(),
      binding: SettingBinding(),
      transition: Transition.noTransition,
    ),
  );
  static final searchPage = AppPages(
    name: _AppRoutes.search,
    page: GetPage(
      name: _AppRoutes.search,
      page: () => SearchPage(),
      binding: SearchBinding(),
      transition: Transition.noTransition,
    ),
  );
}

abstract class _AppRoutes {
  static const home = '/home_tab';
  static const login = '/login';
  static const main = '/main';
  static const notification = '/notification';
  static const post = '/post';
  static const signUp = '/signUp';
  static const splash = '/splash';
  static const search = '/search';
  static const setting = '/setting';
}
