import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PostPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox();

    //   CupertinoTabScaffold(
    //   tabBar: CupertinoTabBar(
    //     items: TabType.values
    //         .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.title))
    //         .toList(),
    //     inactiveColor: AppColors.grayLight,
    //     activeColor: AppColors.primaryColor,
    //   ),
    //   tabBuilder: (context, index) {
    //     final type = TabType.values[index];
    //     switch (type) {
    //       case TabType.headline:
    //         HeadlineBinding().dependencies();
    //         return HeadlinePage();
    //       case TabType.news:
    //         NewsBinding().dependencies();
    //         return NewsPage();
    //       case TabType.profile:
    //         return ProfilePage();
    //     }
    //   },
    // );
  }
}
