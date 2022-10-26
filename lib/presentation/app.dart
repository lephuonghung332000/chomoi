import 'package:chomoi/app/config/themes/app_themes.dart';
import 'package:chomoi/app/services/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';

class App extends StatefulWidget {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final easyLoadingBuilder = EasyLoading.init();

  @override
  void initState() {
    ConnectivityService.get.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final easyLoadingBuilder = EasyLoading.init();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        theme: AppThemes.appThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.splashPage.name,
        getPages: AppPages.pages,
        navigatorKey: App.rootNavigatorKey,
        defaultTransition: Transition.cupertino,
        builder: (context, child) {
          return easyLoadingBuilder(context, child);
        },
      ),
    );
  }
}
