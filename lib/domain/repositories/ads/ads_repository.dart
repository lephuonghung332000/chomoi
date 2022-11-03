import 'package:chomoi/domain/models/response/ads/ads_model.dart';
import 'package:dartz/dartz.dart';

abstract class AdsRepository {
  Future<Either<Exception, List<AdsModel>>> fetchAds();
}
