// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class AppGetNavigator extends Navigator {
  AppGetNavigator({
    Key? key,
    List<Page<dynamic>> pages = const <Page<dynamic>>[],
    bool Function(Route<dynamic>, dynamic)? onPopPage,
    String? initialRoute,
    List<Route<dynamic>> Function(NavigatorState, String)
        onGenerateInitialRoutes = Navigator.defaultGenerateInitialRoutes,
    Route<dynamic>? Function(RouteSettings)? onGenerateRoute,
    Route<dynamic>? Function(RouteSettings)? onUnknownRoute,
    TransitionDelegate<dynamic> transitionDelegate =
        const DefaultTransitionDelegate<dynamic>(),
    bool reportsRouteUpdateToEngine = false,
    List<NavigatorObserver> observers = const <NavigatorObserver>[],
    bool requestFocus = true,
    String? restorationScopeId,
  }) : super(
          key: key,
          pages: pages,
          onPopPage: onPopPage,
          initialRoute: initialRoute,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          onGenerateRoute: (routeSettings) {
            // WARNING(LuuNguyen): A trick to make parameters work when routing with nested navigators
            Get.routing.args = routeSettings.arguments;
            return onGenerateRoute?.call(routeSettings);
          },
          onUnknownRoute: onUnknownRoute,
          transitionDelegate: transitionDelegate,
          reportsRouteUpdateToEngine: reportsRouteUpdateToEngine,
          observers: observers,
          requestFocus: requestFocus,
          restorationScopeId: restorationScopeId,
        );

  static GetPageRoute routeFromGetPage(GetPage getPage,
      {required RouteSettings routeSettings}) {
    return GetPageRoute(
      settings: routeSettings,
      transitionDuration:
          getPage.transitionDuration ?? const Duration(milliseconds: 300),
      opaque: getPage.opaque,
      parameter: getPage.parameters,
      gestureWidth: getPage.gestureWidth,
      curve: getPage.curve,
      alignment: getPage.alignment,
      transition: getPage.transition,
      popGesture: getPage.popGesture,
      customTransition: getPage.customTransition,
      binding: getPage.binding,
      bindings: getPage.bindings,
      routeName: routeSettings.name,
      page: () => getPage.page(),
      title: getPage.title,
      showCupertinoParallax: getPage.showCupertinoParallax,
      maintainState: getPage.maintainState,
      fullscreenDialog: getPage.fullscreenDialog,
      middlewares: getPage.middlewares,
    );
  }
}
