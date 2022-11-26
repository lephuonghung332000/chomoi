import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CategoryRepository {
  Future<Either<DioError, List<CategoryModel>>> fetchCategory();
}
