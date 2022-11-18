import 'package:chomoi/domain/usecases/comment/add_comment_use_case.dart';
import 'package:chomoi/domain/usecases/comment/fetch_comment_use_case.dart';
import 'package:chomoi/domain/usecases/user/fetch_user_use_case.dart';
import 'package:chomoi/presentation/controllers/home_tab/comment/comment_controller.dart';
import 'package:get/get.dart';

class CommentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CommentController>(
      CommentController(
        fetchCommentUseCase: FetchCommentUseCase(),
        addCommentUseCase: AddCommentUseCase(),
        fetchUserUseCase: FetchUserUseCase()
      ),
    );
  }
}
