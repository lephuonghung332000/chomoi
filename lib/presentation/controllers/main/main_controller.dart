import 'package:bottom_nav_layout/bottom_nav_layout.dart';
import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:chomoi/presentation/pages/main/main_page.dart';
import 'package:chomoi/presentation/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

extension TabItemExt on TabType {
  int get index {
    switch (this) {
      case TabType.home:
        return 0;
      case TabType.my_post:
        return 1;
      case TabType.create_post:
        return 2;
      case TabType.notification:
        return 3;
      case TabType.setting:
        return 4;
    }
  }
}

class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static Map<TabType, GlobalKey<NavigatorState>?> navigatorKeys = {
    TabType.home: Get.nestedKey(TabType.home),
    TabType.my_post: Get.nestedKey(TabType.my_post),
    TabType.create_post: Get.nestedKey(TabType.create_post),
    TabType.notification: Get.nestedKey(TabType.notification),
    TabType.setting: Get.nestedKey(TabType.setting),
  };

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: navigatorKeys.length, vsync: this);
    super.onInit();
  }

  static NavigatorState? get homeNavigator =>
      navigatorKeys[TabType.home]?.currentState;

  final keyBottomNavLayout = GlobalKey();
  final pageStack = NoPageStack(initialPage: 0);
  final allTabs = [
    TabType.home,
    TabType.my_post,
    TabType.create_post,
    TabType.notification,
    TabType.setting,
  ];

  TabType get currentTab => _currentTab;
  TabType _currentTab = TabType.home;

  void _onTabChange(TabType tab) async {
    switch (tab) {
      case TabType.home:
        break;
      case TabType.my_post:
        break;
      case TabType.create_post:
        break;
      case TabType.notification:
        break;
      case TabType.setting:
        break;
    }
  }

  void currentTabChanged(int index) async {
    tabController.index = index;

    // If user select same tab
    final TabType tab = allTabs[index];
    if (_currentTab == tab) {
      try {
        // try to pop current route
        await navigatorKeys[tab]?.currentState?.maybePop();
        return;
      } catch (_) {}
    }

    _currentTab = tab;

    _onTabChange(tab);
  }

  void navigateToPage(TabType page) {
    if (_currentTab == page) {
      return;
    }

    // Need update state of BottomNavLayout.
    // ignore: invalid_use_of_protected_member
    keyBottomNavLayout.currentState?.setState(() {
      pageStack.push(page.index);
    });

    currentTabChanged(page.index);

    // Navigate back to the previous page on the stack.
    //pageStack.pop();
  }

  void routeToCreatePostPage({required CategoryModel category}) {
    Get.back();
    Get.toNamed(AppPages.createPostPage.name, arguments: {
      'categoryName': category.name,
    });
  }
}
