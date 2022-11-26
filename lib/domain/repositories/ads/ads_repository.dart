import 'package:chomoi/domain/models/response/ads/ads_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AdsRepository {
  Future<Either<DioError, List<AdsModel>>> fetchAds();
}
