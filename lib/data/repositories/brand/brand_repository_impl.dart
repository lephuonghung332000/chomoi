import 'package:chomoi/data/dto/response/brand/brand_dto.dart';
import 'package:chomoi/data/providers/network/apis/brand_api.dart';
import 'package:chomoi/domain/models/response/brand/brand_model.dart';
import 'package:chomoi/domain/repositories/brand/brand_repository.dart';
import 'package:dartz/dartz.dart';

class BrandRepositoryImpl extends BrandRepository {
  @override
  Future<Either<Exception, List<BrandModel>>> fetchBrand() => Task(
        () => BrandAPI.fetchBrand().request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (response) => BrandModel.fromDto(
                BrandDto.fromJson(response),
              ),
            ),
          )
          .run();
}
