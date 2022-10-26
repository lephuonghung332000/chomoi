import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class LoadingDialog {
  static Future<void> show() {
    return EasyLoading.show(
      indicator: const CupertinoActivityIndicator(
        radius: 15,
        color: AppColors.white,
      ),
    );
  }

  static Future<void> hide() {
    return EasyLoading.dismiss();
  }
}
