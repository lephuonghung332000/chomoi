import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'app/util/dependency.dart';
import 'presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyCreator.init();
  _configAppStyle();
  runApp(App());
}

void _configAppStyle() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light
  ));
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..maskType = EasyLoadingMaskType.custom
    ..toastPosition = EasyLoadingToastPosition.center
    ..animationStyle = EasyLoadingAnimationStyle.scale
    ..textAlign = TextAlign.center
    ..indicatorSize = 45.0
    ..radius = 6.0
    ..fontSize = 15
    ..progressWidth = 2
    ..lineWidth = 4
    ..textColor = AppColors.primaryTextColor
    ..indicatorColor = AppColors.primaryColor
    ..progressColor = AppColors.primaryColor
    ..backgroundColor = AppColors.greyStorm
    ..maskColor = AppColors.black
    ..boxShadow = []
    ..userInteractions = false
    ..dismissOnTap = false;
}
