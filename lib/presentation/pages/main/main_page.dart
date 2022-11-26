import 'package:bottom_nav_layout/bottom_nav_layout.dart';
import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/app/util/get_model_bottom_sheet.dart';
import 'package:chomoi/presentation/controllers/home_tab/home/home_controller.dart';
import 'package:chomoi/presentation/controllers/home_tab/home_tab_navigator.dart';
import 'package:chomoi/presentation/controllers/main/main_controller.dart';
import 'package:chomoi/presentation/controllers/my_post_tab/my_post_tab_navigator.dart';
import 'package:chomoi/presentation/controllers/notification_tab/notification_tab_navigator.dart';
import 'package:chomoi/presentation/controllers/setting_tab/setting_tab_navigator.dart';
import 'package:chomoi/presentation/widgets/category_list_view.dart';
import 'package:chomoi/presentation/widgets/hanlde_popover.dart';
import 'package:chomoi/presentation/widgets/loading_screen.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TabType { home, my_post, create_post, notification, setting }

extension TabItemName on TabType {
  static const double iconSize = AppConstant.iconSize;
  static const double iconBottomPadding = 4;

  String get name {
    switch (this) {
      case TabType.home:
        return AppStrings.menu_home;
      case TabType.my_post:
        return AppStrings.menu_post;
      case TabType.create_post:
        return AppStrings.menu_create_post;
      case TabType.notification:
        return AppStrings.menu_notification;
      case TabType.setting:
        return AppStrings.menu_setting;
    }
  }

  Widget get icon {
    switch (this) {
      case TabType.home:
        return const Padding(
          padding: EdgeInsets.only(bottom: iconBottomPadding),
          child: SvgIcon(
            icon: AppAssets.iconHome,
            size: iconSize,
          ),
        );
      case TabType.my_post:
        return const Padding(
          padding: EdgeInsets.only(bottom: iconBottomPadding),
          child: SvgIcon(
            icon: AppAssets.iconPost,
            size: iconSize,
          ),
        );
      case TabType.create_post:
        return const Padding(
          padding: EdgeInsets.only(bottom: iconBottomPadding),
          child: SvgIcon(
            icon: AppAssets.iconCreatePost,
            size: iconSize,
          ),
        );
      case TabType.notification:
        return const Padding(
          padding: EdgeInsets.only(bottom: iconBottomPadding),
          child: SvgIcon(
            icon: AppAssets.iconNotification,
            size: iconSize,
          ),
        );
      case TabType.setting:
        return const Padding(
          padding: EdgeInsets.only(bottom: iconBottomPadding),
          child: SvgIcon(
            icon: AppAssets.iconSetting,
            size: iconSize,
          ),
        );
    }
  }

  Widget get activeIcon {
    switch (this) {
      case TabType.home:
        return const Padding(
          padding: EdgeInsets.only(bottom: iconBottomPadding),
          child: SvgIcon(
            icon: AppAssets.iconHomeActive,
            size: iconSize,
          ),
        );
      case TabType.my_post:
        return const Padding(
          padding: EdgeInsets.only(bottom: iconBottomPadding),
          child: SvgIcon(
            icon: AppAssets.iconPostActive,
            size: iconSize,
          ),
        );
      case TabType.create_post:
        return const Padding(
          padding: EdgeInsets.only(bottom: iconBottomPadding),
          child: SvgIcon(
            icon: AppAssets.iconCreatePostActive,
            size: iconSize,
          ),
        );
      case TabType.notification:
        return const Padding(
          padding: EdgeInsets.only(bottom: iconBottomPadding),
          child: SvgIcon(
            icon: AppAssets.iconNotificationActive,
            size: iconSize,
          ),
        );
      case TabType.setting:
        return const Padding(
          padding: EdgeInsets.only(bottom: iconBottomPadding),
          child: SvgIcon(
            icon: AppAssets.iconSettingActive,
            size: iconSize,
          ),
        );
    }
  }

  Widget get page {
    switch (this) {
      case TabType.home:
        return HomeTabNavigator(
            navigatorKey: MainController.navigatorKeys[this]);
      case TabType.my_post:
        return MyPostTabNavigator(
            navigatorKey: MainController.navigatorKeys[this]);
      case TabType.notification:
        return NotificationTabNavigator(
            navigatorKey: MainController.navigatorKeys[this]);
      case TabType.setting:
        return SettingTabNavigator(
            navigatorKey: MainController.navigatorKeys[this]);
      case TabType.create_post:
        return HomeTabNavigator(
            navigatorKey: MainController.navigatorKeys[this]);
    }
  }
}

class CustomAppBarStyle extends StyleHook {
  @override
  double get activeIconSize => AppConstant.iconSize;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => AppConstant.iconSize;

  @override
  TextStyle textStyle(Color color, String? fontFamily) =>
      AppTextStyles.smallRegular11w400.apply(
        color: color,
      );
}

class MainPage extends GetWidget<MainController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !(await MainController
                .navigatorKeys[controller.currentTab]?.currentState
                ?.maybePop() ??
            false);
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              _showCategoryBottomSheet(_buildCategoryList, context),
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          child: const SvgIcon(
            icon: AppAssets.iconCreatePostActive,
            size: AppConstant.iconSize,
            color: AppColors.black,
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: BottomNavLayout(
          key: controller.keyBottomNavLayout,
          savePageState: true,
          lazyLoadPages: true,
          extendBody: false,
          resizeToAvoidBottomInset: true,
          pageStack: controller.pageStack,
          pages: controller.allTabs.map((e) => (_) => e.page).toList(),
          bottomNavigationBar: (currentIndex, onTap) => StyleProvider(
            style: CustomAppBarStyle(),
            child: ConvexAppBar(
              controller: controller.tabController,
              style: TabStyle.fixed,
              initialActiveIndex: currentIndex,
              color: AppColors.tertiaryTextColor,
              activeColor: AppColors.primaryColor,
              backgroundColor: AppColors.secondaryBackgroundColor,
              onTap: (index) async {
                if (index != 2) {
                  onTap(index);
                  controller.currentTabChanged(index);
                } else {
                  _showCategoryBottomSheet(_buildCategoryList, context);
                }
              },
              items: controller.allTabs
                  .map(
                    (e) => TabItem(
                      icon: e.icon,
                      title: e.name,
                      activeIcon: e.activeIcon,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _buildCategoryList => GetX<MainController>(
        builder: (controller) {
          return Get.find<HomeController>().categoryState.when(
                loading: () => const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: LoadingScreen(),
                ),
                success: (categories) => CategoryListView(
                  categories: categories,
                  onTap: (category) {
                    controller.routeToCreatePostPage(category: category);
                  },
                ),
                failure: (exception) => const SizedBox.shrink(),
                init: (entity) => const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: LoadingScreen(),
                ),
              );
        },
      );

  Future<void> _showCategoryBottomSheet(
      Widget categoryView, BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.modalBottomSheet(
      HandlePopover(
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.only(bottom: 30),
        boxShadow: kElevationToShadow[4],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10),
        ),
        height: heightBottomSheet(context),
        child: categoryView,
      ),
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.5),
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      isDismissible: false,
    );
  }

  double heightBottomSheet(context) =>
      MediaQuery.of(context).size.height -
      (MediaQuery.of(context).padding.top + AppConstant.heightAppBarSearch);
}
