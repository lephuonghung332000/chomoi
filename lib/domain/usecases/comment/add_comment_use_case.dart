import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/comment/comment_repository_impl.dart';
import 'package:chomoi/domain/models/request/comment/comment_request_model.dart';
import 'package:chomoi/domain/repositories/comment/comment_repository.dart';
import 'package:dartz/dartz.dart';

class AddCommentUseCase extends ParamUseCase<
    Either<Exception, Unit>, CommentRequestModel> {
  late final CommentRepository _repo;

  AddCommentUseCase({CommentRepository? commentRepository}) {
    _repo = commentRepository ?? CommentRepositoryImpl();
  }

  @override
  Future<Either<Exception, Unit>> call(params) {
    return _repo.addComment(params);
  }
}
