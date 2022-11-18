import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:chomoi/presentation/widgets/app_get_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTabNavigatorRoutes {
  HomeTabNavigatorRoutes._();

  static final home = AppPages.homePage.name;
  static final search = AppPages.searchPage.name;
  static final post = AppPages.postPage.name;
}

class HomeTabNavigator extends StatelessWidget {
  const HomeTabNavigator({this.navigatorKey});

  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  Widget build(BuildContext context) {
    return AppGetNavigator(
      key: navigatorKey,
      initialRoute: HomeTabNavigatorRoutes.home,
      onGenerateRoute: (routeSettings) {
        final GetPage? getPage = AppPages.pages.firstWhereOrNull((route) {
          final routeName = routeSettings.name;
          if (routeName != null) {
            return route.path.regex.hasMatch(routeName);
          } else {
            return false;
          }
        });
        if (getPage != null) {
          return AppGetNavigator.routeFromGetPage(getPage,
              routeSettings: routeSettings);
        } else {
          return null;
        }
      },
    );
  }
}
