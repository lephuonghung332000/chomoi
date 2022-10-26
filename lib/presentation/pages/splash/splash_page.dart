import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/presentation/controllers/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppAssets.appSplashLogo),
      ),
    );
  }
}
