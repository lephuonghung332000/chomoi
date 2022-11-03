import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:chomoi/presentation/widgets/app_get_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostTabNavigatorRoutes {
  PostTabNavigatorRoutes._();

  static final post = AppPages.postPage.name;
}

class PostTabNavigator extends StatelessWidget {
  const PostTabNavigator({this.navigatorKey});

  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  Widget build(BuildContext context) {
    return AppGetNavigator(
      key: navigatorKey,
      initialRoute: PostTabNavigatorRoutes.post,
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
