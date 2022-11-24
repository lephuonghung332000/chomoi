import 'package:chomoi/domain/models/response/brand/brand_model.dart';
import 'package:dartz/dartz.dart';

abstract class BrandRepository {
  Future<Either<Exception, List<BrandModel>>> fetchBrand();
}
