import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/presentation/controllers/home/home_tab_navigator.dart';
import 'package:chomoi/presentation/controllers/login/login_controller.dart';
import 'package:chomoi/presentation/controllers/main/main_controller.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TabItem { home, post, create_post, go_market, add }

extension TabItemName on TabItem {
  static const double iconSize = 22;
  static const double iconBottomPadding = 4;

  String get name {
    switch (this) {
      case TabItem.home:
        return AppStrings.menu_home;
      case TabItem.post:
        return AppStrings.menu_post;
      case TabItem.create_post:
        return AppStrings.menu_create_post;
      case TabItem.go_market:
        return AppStrings.menu_go_market;
      case TabItem.add:
        return AppStrings.menu_add;
    }
  }

  Widget get icon {
    switch (this) {
      case TabItem.home:
        return const Padding(
          padding: EdgeInsets.only(bottom: iconBottomPadding),
          child: SvgIcon(
            icon: AppAssets.iconHome,
            size: iconSize,
          ),
        );
      case TabItem.post:
        // TODO: Handle this case.
        break;
      case TabItem.create_post:
        // TODO: Handle this case.
        break;
      case TabItem.go_market:
        // TODO: Handle this case.
        break;
      case TabItem.add:
        // TODO: Handle this case.
        break;
    }
  }

  Widget get page {
    switch (this) {
      case TabItem.home:
        return HomeTabNavigator(
            navigatorKey: MainController.navigatorKeys[this]);
      case TabItem.post:
        // TODO: Handle this case.
        break;
      case TabItem.create_post:
        // TODO: Handle this case.
        break;
      case TabItem.go_market:
        // TODO: Handle this case.
        break;
      case TabItem.add:
        // TODO: Handle this case.
        break;
    }
  }
}

class MainPage extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Main page'),
      ),
    );
  }
}
