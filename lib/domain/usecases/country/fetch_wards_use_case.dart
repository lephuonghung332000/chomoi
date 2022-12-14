import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/country/country_repository_impl.dart';
import 'package:chomoi/domain/models/response/country/ward_model.dart';
import 'package:chomoi/domain/repositories/country/country_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchWardsUseCase
    extends ParamUseCase<Either<DioError, List<WardModel>>, int> {
  late final CountryRepository _repo;

  FetchWardsUseCase({CountryRepository? countryRepository}) {
    _repo = countryRepository ?? CountryRepositoryImpl();
  }

  @override
  Future<Either<DioError, List<WardModel>>> call(params) {
    return _repo.fetchWards(districtId: params);
  }
}
