import 'package:bottom_nav_layout/bottom_nav_layout.dart';
import 'package:chomoi/presentation/pages/main/main_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

extension TabItemExt on TabItem {
  int get index {
    switch (this) {
      case TabItem.home:
        return 0;
      case TabItem.post:
        return 1;
      case TabItem.create_post:
        return 2;
      case TabItem.go_market:
        return 3;
      case TabItem.add:
        return 4;
    }
  }
}

class MainController extends GetxController {
  static Map<TabItem, GlobalKey<NavigatorState>?> navigatorKeys = {
    TabItem.home: Get.nestedKey(TabItem.home),
    TabItem.post: Get.nestedKey(TabItem.post),
    TabItem.create_post: Get.nestedKey(TabItem.create_post),
    TabItem.go_market: Get.nestedKey(TabItem.go_market),
    TabItem.add: Get.nestedKey(TabItem.add),
  };

  static NavigatorState? get homeNavigator =>
      navigatorKeys[TabItem.home]?.currentState;

  final keyBottomNavLayout = GlobalKey();
  final pageStack = NoPageStack(initialPage: 0);
  final allTabs = [
    TabItem.home,
    TabItem.post,
    TabItem.create_post,
    TabItem.go_market,
    TabItem.add,
  ];

  TabItem get currentTab => _currentTab;
  final TabItem _currentTab = TabItem.home;

  void _onTabChange(TabItem tab) async {
    switch (tab) {
      case TabItem.home:
        // TODO: Handle this case.
        break;
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

  void currentTabChanged(int index) async {
  }

  void navigateToPage(TabItem page) {
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

}
