import 'package:chomoi/domain/usecases/chat/add_message_chat_use_case.dart';
import 'package:chomoi/presentation/controllers/content_chat/content_chat_controller.dart';
import 'package:get/get.dart';

class ContentChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ContentChatController>(
      ContentChatController(
        addMessageChatUseCase: AddMessageChatUseCase(),
      ),
    );
  }
}
