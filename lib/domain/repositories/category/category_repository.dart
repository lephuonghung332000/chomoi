import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Future<Either<Exception, List<CategoryModel>>> fetchCategory();
}
