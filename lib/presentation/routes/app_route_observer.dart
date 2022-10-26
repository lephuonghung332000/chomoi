// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  static final AppRouteObserver get =
      Get.put(AppRouteObserver(), permanent: true);

  final Map<String, int> _existsRoutes = {};

  bool routeExists(String route) {
    if (_existsRoutes.containsKey(route)) {
      return (_existsRoutes[route] as int) > 0;
    } else {
      return false;
    }
  }

  void _addRoute(String route) {
    if (_existsRoutes.containsKey(route)) {
      _existsRoutes[route] = (_existsRoutes[route] as int) + 1;
    } else {
      _existsRoutes[route] = 1;
    }
  }

  void _removeRoute(String route) {
    if (_existsRoutes.containsKey(route)) {
      _existsRoutes[route] = (_existsRoutes[route] as int) - 1;
    }
  }

  void _screenViewAppear(PageRoute<dynamic> route) {
    final screenName = route.settings.name;
    if (kDebugMode) {
      print('[AppRouteObserver]: Screen appear "$screenName"');
    }
    // Do something with it, ie. send it to your analytics service collector
  }

  void _screenViewDisappear(PageRoute<dynamic> route) {
    final screenName = route.settings.name;
    if (kDebugMode) {
      print('[AppRouteObserver]: Screen disappear "$screenName"');
    }
  }

  void _screenViewReplaced(PageRoute<dynamic> route) {
    final screenName = route.settings.name;
    if (kDebugMode) {
      print('[AppRouteObserver]: Screen replaced "$screenName"');
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

    // route is the Route that will be push (add) to navigator
    if (route is PageRoute) {
      final screenName = route.settings.name;
      if (screenName != null) {
        _addRoute(screenName);
      }
      _screenViewAppear(route);
    }

    // previousRoute is the Route that will be deactivated in navigator
    if (previousRoute is PageRoute) {
      _screenViewDisappear(previousRoute);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);

    // previousRoute is the Route that will be activated again
    if (previousRoute is PageRoute) {
      _screenViewAppear(previousRoute);
    }

    // route is the Route that will be pop (remove) from navigator
    if (route is PageRoute) {
      final screenName = route.settings.name;
      if (screenName != null) {
        _removeRoute(screenName);
      }
      _screenViewDisappear(route);
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    if (route is PageRoute) {
      final screenName = route.settings.name;
      if (screenName != null) {
        _removeRoute(screenName);
      }
      _screenViewDisappear(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      final screenName = newRoute.settings.name;
      if (screenName != null) {
        _addRoute(screenName);
      }
      _screenViewReplaced(newRoute);
    }
    if (oldRoute is PageRoute) {
      final screenName = oldRoute.settings.name;
      if (screenName != null) {
        _removeRoute(screenName);
      }
    }
  }
}
