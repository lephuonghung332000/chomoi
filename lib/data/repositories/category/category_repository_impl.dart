import 'package:chomoi/data/dto/response/category/category_dto.dart';
import 'package:chomoi/data/providers/network/apis/category_api.dart';
import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:chomoi/domain/repositories/category/category_repository.dart';
import 'package:dartz/dartz.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either<Exception, List<CategoryModel>>> fetchCategory() => Task(
        () => CategoryAPI.fetchCategory().request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (response) => CategoryModel.fromDto(
                CategoryDto.fromJson(response),
              ),
            ),
          )
          .run();
}
