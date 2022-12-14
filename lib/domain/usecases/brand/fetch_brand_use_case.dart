import 'package:chomoi/app/core/usecases/no_param_usecase.dart';
import 'package:chomoi/data/repositories/brand/brand_repository_impl.dart';
import 'package:chomoi/domain/models/response/brand/brand_model.dart';
import 'package:chomoi/domain/repositories/brand/brand_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchBrandUseCase
    extends NoParamUseCase<Either<DioError, List<BrandModel>>> {
  late final BrandRepository _repo;

  FetchBrandUseCase({BrandRepository? brandRepository}) {
    _repo = brandRepository ?? BrandRepositoryImpl();
  }

  @override
  Future<Either<DioError, List<BrandModel>>> call() {
    return _repo.fetchBrand();
  }
}
