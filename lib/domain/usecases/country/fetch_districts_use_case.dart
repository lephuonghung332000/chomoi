import 'package:chomoi/app/core/usecases/pram_usecase.dart';
import 'package:chomoi/data/repositories/country/country_repository_impl.dart';
import 'package:chomoi/domain/models/response/country/district_model.dart';
import 'package:chomoi/domain/repositories/country/country_repository.dart';
import 'package:dartz/dartz.dart';

class FetchDistrictsUseCase
    extends ParamUseCase<Either<Exception, List<DistrictModel>>, int> {
  late final CountryRepository _repo;

  FetchDistrictsUseCase({CountryRepository? countryRepository}) {
    _repo = countryRepository ?? CountryRepositoryImpl();
  }

  @override
  Future<Either<Exception, List<DistrictModel>>> call(int params) {
    return _repo.fetchDistricts(provinceId: params);
  }
}
