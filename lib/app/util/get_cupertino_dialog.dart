import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

extension GetCupertinoDialog on GetInterface {
  Future<T?> cupertinoDialog<T>({
    String? title,
    TextStyle? titleStyle,
    Widget? content,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    VoidCallback? onCustom,
    Color? cancelTextColor,
    Color? confirmTextColor,
    String? textConfirm,
    String? textCancel,
    String? textCustom,
    CupertinoDialogAction? confirm,
    CupertinoDialogAction? cancel,
    CupertinoDialogAction? custom,
    Color? backgroundColor,
    bool barrierDismissible = false,
    String? middleText,
    TextStyle? middleTextStyle,
    //   ThemeData themeData,
    List<CupertinoDialogAction>? actions,

    // onWillPop Scope
    WillPopCallback? onWillPop,

    // the navigator used to push the dialog
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    final leanCancel = onCancel != null || textCancel != null;
    final leanConfirm = onConfirm != null || textConfirm != null;
    actions ??= [];

    if (cancel != null) {
      actions.add(cancel);
    } else {
      if (leanCancel) {
        actions.add(CupertinoDialogAction(
          isDefaultAction: false,
          onPressed: () {
            onCancel?.call();
            back();
          },
          child: Text(textCancel ?? AppStrings.button_cancel),
        ));
      }
    }
    if (confirm != null) {
      actions.add(confirm);
    } else {
      if (leanConfirm) {
        actions.add(
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: onConfirm,
            child: Text(
              textConfirm ?? AppStrings.button_ok,
            ),
          ),
        );
      }
    }

    final Widget baseAlertDialog = CupertinoAlertDialog(
      title: title != null
          ? Text(
              title,
              textAlign: TextAlign.center,
              style: titleStyle,
            )
          : null,
      content: content ??
          (middleText != null
              ? Text(
                  middleText,
                  textAlign: TextAlign.center,
                  style: middleTextStyle,
                )
              : null),
      actions: actions,
    );

    return dialog<T>(
      onWillPop != null
          ? WillPopScope(
              onWillPop: onWillPop,
              child: baseAlertDialog,
            )
          : baseAlertDialog,
      barrierDismissible: barrierDismissible,
      navigatorKey: navigatorKey,
    );
  }
}
