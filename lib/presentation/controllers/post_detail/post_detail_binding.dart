import 'package:chomoi/domain/usecases/chat/add_chat_use_case.dart';
import 'package:chomoi/domain/usecases/comment/fetch_comment_use_case.dart';
import 'package:chomoi/domain/usecases/contact/contact_phone_use_case.dart';
import 'package:chomoi/domain/usecases/contact/contact_sms_use_case.dart';
import 'package:chomoi/domain/usecases/post/fetch_post_use_case.dart';
import 'package:chomoi/domain/usecases/user/fetch_user_use_case.dart';
import 'package:chomoi/presentation/controllers/post_detail/post_detail_controller.dart';
import 'package:get/get.dart';

class PostDetailBinging extends Bindings {
  @override
  void dependencies() {
    final tag = Get.arguments['tag'];
    Get.put<PostDetailController>(
      PostDetailController(
        fetchUserUseCase: FetchUserUseCase(),
        contactSmsUseCase: ContactSmsUseCase(),
        contactPhoneUseCase: ContactPhoneUseCase(),
        fetchPostUseCase: FetchPostUseCase(),
        fetchCommentUseCase: FetchCommentUseCase(),
        addChatUseCase: AddChatUseCase(),
      ),
      tag: tag,
    );
  }
}
