import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Exception, List<PostModel>>> fetchPost({
    String? status,
    int? page,
  });
}
