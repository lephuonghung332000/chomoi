import 'package:chomoi/domain/usecases/chat/fetch_chat_use_case.dart';
import 'package:chomoi/presentation/controllers/chat/chat_controller.dart';
import 'package:get/get.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChatController>(
      ChatController(
        fetchChatUseCase: FetchChatUseCase(),
      ),
    );
  }
}
