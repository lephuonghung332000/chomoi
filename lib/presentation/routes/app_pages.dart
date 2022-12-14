import 'package:chomoi/presentation/controllers/chat/chat_binding.dart';
import 'package:chomoi/presentation/controllers/content_chat/content_chat_binding.dart';
import 'package:chomoi/presentation/controllers/create_post/create_post_binding.dart';
import 'package:chomoi/presentation/controllers/create_post_success/create_post_success_binding.dart';
import 'package:chomoi/presentation/controllers/home_tab/category_selection/category_selection_binding.dart';
import 'package:chomoi/presentation/controllers/home_tab/comment/comment_binding.dart';
import 'package:chomoi/presentation/controllers/home_tab/home/home_binding.dart';
import 'package:chomoi/presentation/controllers/home_tab/post/post_binding.dart';
import 'package:chomoi/presentation/controllers/home_tab/province_selection/province_selection_binding.dart';
import 'package:chomoi/presentation/controllers/home_tab/related_post/related_post_binding.dart';
import 'package:chomoi/presentation/controllers/home_tab/search/search_binding.dart';
import 'package:chomoi/presentation/controllers/login/login_binding.dart';
import 'package:chomoi/presentation/controllers/main/main_binding.dart';
import 'package:chomoi/presentation/controllers/my_post_tab/my_post/my_post_binding.dart';
import 'package:chomoi/presentation/controllers/notification_tab/notification/notification_binding.dart';
import 'package:chomoi/presentation/controllers/post_detail/post_detail_binding.dart';
import 'package:chomoi/presentation/controllers/setting_tab/edit_user/edit_user_binding.dart';
import 'package:chomoi/presentation/controllers/setting_tab/setting/setting_binding.dart';
import 'package:chomoi/presentation/controllers/setting_tab/showing_post/showing_post_binding.dart';
import 'package:chomoi/presentation/controllers/sign_up/sign_up_binding.dart';
import 'package:chomoi/presentation/controllers/splash/splash_binding.dart';
import 'package:chomoi/presentation/pages/chat/chat_page.dart';
import 'package:chomoi/presentation/pages/content_chat/content_chat_page.dart';
import 'package:chomoi/presentation/pages/create_post/create_post_page.dart';
import 'package:chomoi/presentation/pages/create_post_success/create_post_success_page.dart';
import 'package:chomoi/presentation/pages/home_tab/category_selection/category_selection_page.dart';
import 'package:chomoi/presentation/pages/comment/comment_page.dart';
import 'package:chomoi/presentation/pages/home_tab/home/home_page.dart';
import 'package:chomoi/presentation/pages/home_tab/post/post_page.dart';
import 'package:chomoi/presentation/pages/home_tab/province_selection/province_selection_page.dart';
import 'package:chomoi/presentation/pages/home_tab/related_post/related_post_page.dart';
import 'package:chomoi/presentation/pages/home_tab/search/search_page.dart';
import 'package:chomoi/presentation/pages/login/login_page.dart';
import 'package:chomoi/presentation/pages/main/main_page.dart';
import 'package:chomoi/presentation/pages/my_post_tab/my_post_page.dart';
import 'package:chomoi/presentation/pages/notification_tab/notification/notification_page.dart';
import 'package:chomoi/presentation/pages/post_detail/post_detail_page.dart';
import 'package:chomoi/presentation/pages/setting_tab/edit_user/edit_user_page.dart';
import 'package:chomoi/presentation/pages/setting_tab/setting/setting_page.dart';
import 'package:chomoi/presentation/pages/setting_tab/showing_post/showing_post_page.dart';
import 'package:chomoi/presentation/pages/sign_up/sign_up_page.dart';
import 'package:chomoi/presentation/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    createPostPage,
    createPostSuccessPage,
    chatPage,
    commentPage,
    contentChatPage,
    categorySelectionPage,
    editUserPage,
    homePage,
    loginPage,
    mainPage,
    myPostPage,
    notificationPage,
    postDetailPage,
    postPage,
    provinceSelectionPage,
    relatedPostPage,
    signUpPage,
    splashPage,
    searchPage,
    settingPage,
    showingPostPage,
  ].map((e) => e.page).toList();

  final GetPage page;
  final String name;

  AppPages({required this.name, required this.page});

  static final splashPage = AppPages(
    name: _AppRoutes.splash,
    page: GetPage(
      name: _AppRoutes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
      transition: Transition.noTransition,
    ),
  );

  static final showingPostPage = AppPages(
    name: _AppRoutes.showingPost,
    page: GetPage(
      name: _AppRoutes.showingPost,
      page: () => ShowingPostPage(),
      binding: ShowingPostBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
  );
  static final myPostPage = AppPages(
    name: _AppRoutes.myPost,
    page: GetPage(
      name: _AppRoutes.myPost,
      page: () => MyPostPage(),
      binding: MyPostBinding(),
      transition: Transition.noTransition,
    ),
  );
  static final commentPage = AppPages(
    name: _AppRoutes.comment,
    page: GetPage(
      name: _AppRoutes.comment,
      page: () => CommentPage(),
      binding: CommentBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 700),
    ),
  );
  static final chatPage = AppPages(
    name: _AppRoutes.chat,
    page: GetPage(
      name: _AppRoutes.chat,
      page: () => ChatPage(),
      binding: ChatBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 700),
    ),
  );
  static final contentChatPage = AppPages(
    name: _AppRoutes.contentChat,
    page: GetPage(
      name: _AppRoutes.contentChat,
      page: () => ContentChatPage(),
      binding: ContentChatBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 700),
    ),
  );
  static final createPostSuccessPage = AppPages(
    name: _AppRoutes.createPostSuccess,
    page: GetPage(
      name: _AppRoutes.createPostSuccess,
      page: () => CreatePostSuccessPage(),
      binding: CreatePostSuccessBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 700),
    ),
  );
  static final relatedPostPage = AppPages(
    name: _AppRoutes.relatedPost,
    page: GetPage(
      name: _AppRoutes.relatedPost,
      page: () => RelatedPostPage(),
      binding: RelatedPostBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 700),
    ),
  );
  static final postDetailPage = AppPages(
    name: _AppRoutes.postDetail,
    page: GetPage(
      name: _AppRoutes.postDetail,
      page: () => const PostDetailPage(),
      binding: PostDetailBinging(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 700),
    ),
  );
  static final mainPage = AppPages(
    name: _AppRoutes.main,
    page: GetPage(
      name: _AppRoutes.main,
      page: () => MainPage(),
      binding: MainBinding(),
      transition: Transition.fadeIn,
    ),
  );

  static final loginPage = AppPages(
    name: _AppRoutes.login,
    page: GetPage(
      name: _AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350),
    ),
  );
  static final signUpPage = AppPages(
    name: _AppRoutes.signUp,
    page: GetPage(
      name: _AppRoutes.signUp,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 700),
    ),
  );

  static final homePage = AppPages(
    name: _AppRoutes.home,
    page: GetPage(
      name: _AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
  );
  static final categorySelectionPage = AppPages(
    name: _AppRoutes.categorySelection,
    page: GetPage(
      name: _AppRoutes.categorySelection,
      page: () => CategorySelectionPage(),
      binding: CategorySelectionBinding(),
      transition: Transition.noTransition,
    ),
  );
  static final provinceSelectionPage = AppPages(
    name: _AppRoutes.provinceSelection,
    page: GetPage(
      name: _AppRoutes.provinceSelection,
      page: () => ProvinceSelectionPage(),
      binding: ProvinceSelectionBinding(),
      transition: Transition.noTransition,
    ),
  );
  static final postPage = AppPages(
    name: _AppRoutes.post,
    page: GetPage(
      name: _AppRoutes.post,
      page: () => PostPage(),
      binding: PostBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350),
    ),
  );
  static final notificationPage = AppPages(
    name: _AppRoutes.notification,
    page: GetPage(
      name: _AppRoutes.notification,
      page: () => NotificationPage(),
      binding: NotificationBinding(),
      transition: Transition.noTransition,
    ),
  );
  static final settingPage = AppPages(
    name: _AppRoutes.setting,
    page: GetPage(
      name: _AppRoutes.setting,
      page: () => SettingPage(),
      binding: SettingBinding(),
      transition: Transition.noTransition,
    ),
  );
  static final searchPage = AppPages(
    name: _AppRoutes.search,
    page: GetPage(
      name: _AppRoutes.search,
      page: () => SearchPage(),
      binding: SearchBinding(),
      transition: Transition.noTransition,
    ),
  );

  static final editUserPage = AppPages(
    name: _AppRoutes.editUser,
    page: GetPage(
      name: _AppRoutes.editUser,
      page: () => EditUserPage(),
      binding: EditUserBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
  );

  static final createPostPage = AppPages(
    name: _AppRoutes.createPost,
    page: GetPage(
      name: _AppRoutes.createPost,
      page: () => CreatePostPage(),
      binding: CreatePostBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  );
}

abstract class _AppRoutes {
  static const createPost = '/createPost';
  static const createPostSuccess = '/createPostSuccess';
  static const chat = '/chat';
  static const contentChat = '/contentChat';
  static const home = '/home_tab';
  static const comment = '/comment';
  static const login = '/login';
  static const main = '/main';
  static const notification = '/notification';
  static const post = '/post';
  static const postDetail = '/postDetail';
  static const myPost = '/myPost';
  static const relatedPost = '/relatedPost';
  static const signUp = '/signUp';
  static const splash = '/splash';
  static const search = '/search';
  static const setting = '/setting';
  static const showingPost = '/showingPost';
  static const categorySelection = '/categorySelection';
  static const provinceSelection = '/provinceSelection';
  static const editUser = '/editUser';
}
