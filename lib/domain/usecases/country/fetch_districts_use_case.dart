import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/country/country_repository_impl.dart';
import 'package:chomoi/domain/models/response/country/district_model.dart';
import 'package:chomoi/domain/repositories/country/country_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchDistrictsUseCase
    extends ParamUseCase<Either<DioError, List<DistrictModel>>, int> {
  late final CountryRepository _repo;

  FetchDistrictsUseCase({CountryRepository? countryRepository}) {
    _repo = countryRepository ?? CountryRepositoryImpl();
  }

  @override
  Future<Either<DioError, List<DistrictModel>>> call(params) {
    return _repo.fetchDistricts(provinceId: params);
  }
}
