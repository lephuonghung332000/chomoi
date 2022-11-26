import 'package:chomoi/data/dto/response/ads/ads_dto.dart';
import 'package:chomoi/data/providers/network/apis/ads_api.dart';
import 'package:chomoi/domain/models/response/ads/ads_model.dart';
import 'package:chomoi/domain/repositories/ads/ads_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AdsRepositoryImpl extends AdsRepository {
  @override
  Future<Either<DioError, List<AdsModel>>> fetchAds() => Task(
        () => AdsAPI.fetchAds().request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<DioError>(
              (l) {
                return l as DioError;
              },
            ).map(
              (response) => AdsModel.fromDto(
                AdsDto.fromJson(response),
              ),
            ),
          )
          .run();
}
