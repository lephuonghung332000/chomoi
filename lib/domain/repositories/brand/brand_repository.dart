import 'package:chomoi/domain/models/response/brand/brand_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class BrandRepository {
  Future<Either<DioError, List<BrandModel>>> fetchBrand();
}
