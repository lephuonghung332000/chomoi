import 'package:chomoi/data/dto/response/ads/ads_dto.dart';
import 'package:chomoi/data/providers/network/apis/ads_api.dart';
import 'package:chomoi/domain/models/response/ads/ads_model.dart';
import 'package:chomoi/domain/repositories/ads/ads_repository.dart';
import 'package:dartz/dartz.dart';

class AdsRepositoryImpl extends AdsRepository {
  @override
  Future<Either<Exception, List<AdsModel>>> fetchAds() => Task(
        () => AdsAPI.fetchAds().request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (response) => AdsModel.fromDto(
                AdsDto.fromJson(response),
              ),
            ),
          )
          .run();
}
