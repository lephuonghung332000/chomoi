import 'package:chomoi/app/core/usecases/no_param_usecase.dart';
import 'package:chomoi/data/repositories/category/category_repository_impl.dart';
import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:chomoi/domain/repositories/category/category_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchCategoryUseCase
    extends NoParamUseCase<Either<DioError, List<CategoryModel>>> {
  late final CategoryRepository _repo;

  FetchCategoryUseCase({CategoryRepository? categoryRepository}) {
    _repo = categoryRepository ?? CategoryRepositoryImpl();
  }

  @override
  Future<Either<DioError, List<CategoryModel>>> call() {
    return _repo.fetchCategory();
  }
}
