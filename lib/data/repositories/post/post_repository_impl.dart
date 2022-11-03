import 'package:chomoi/data/dto/response/post/post_dto.dart';
import 'package:chomoi/data/providers/network/apis/post_api.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/domain/repositories/post/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl extends PostRepository {
  @override
  Future<Either<Exception, List<PostModel>>> fetchPost({
    String? status,
    int? page,
  }) =>
      Task(
        () => PostAPI.fetchPost(status: status, page: page).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (response) => PostModel.fromDto(
                PostDto.fromJson(response),
              ),
            ),
          )
          .run();
}
