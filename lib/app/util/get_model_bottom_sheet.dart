import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ExtensionModalBottomSheet on GetInterface {
  Future<T?> modalBottomSheet<T>(Widget bottomSheet,
      {Color? backgroundColor,
        double? elevation,
        ShapeBorder? shape,
        Clip? clipBehavior,
        BoxConstraints? constraints,
        Color? barrierColor,
        bool isScrollControlled = true,
        bool useRootNavigator = true,
        bool isDismissible = true,
        bool enableDrag = true,
        RouteSettings? routeSettings,
        AnimationController? transitionAnimationController}) {
    return showModalBottomSheet(
      context: overlayContext!,
      builder: (_) => bottomSheet,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
    );
  }
}
