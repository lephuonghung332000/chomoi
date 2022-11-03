import 'package:chomoi/app/core/usecases/no_param_usecase.dart';
import 'package:chomoi/data/repositories/ads/ads_repository_impl.dart';
import 'package:chomoi/domain/models/response/ads/ads_model.dart';
import 'package:chomoi/domain/repositories/ads/ads_repository.dart';
import 'package:dartz/dartz.dart';

class FetchAdsUseCase
    extends NoParamUseCase<Either<Exception, List<AdsModel>>> {
  late final AdsRepository _repo;

  FetchAdsUseCase({AdsRepository? adsRepository}) {
    _repo = adsRepository ?? AdsRepositoryImpl();
  }

  @override
  Future<Either<Exception, List<AdsModel>>> call() {
    return _repo.fetchAds();
  }
}
