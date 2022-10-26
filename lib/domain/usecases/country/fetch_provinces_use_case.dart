import 'package:chomoi/app/core/usecases/no_param_usecase.dart';
import 'package:chomoi/data/repositories/country/country_repository_impl.dart';
import 'package:chomoi/domain/models/response/country/province_model.dart';
import 'package:chomoi/domain/repositories/country/country_repository.dart';
import 'package:dartz/dartz.dart';

class FetchProvincesUseCase
    extends NoParamUseCase<Either<Exception, List<ProvinceModel>>> {
  late final CountryRepository _repo;

  FetchProvincesUseCase({CountryRepository? countryRepository}) {
    _repo = countryRepository ?? CountryRepositoryImpl();
  }

  @override
  Future<Either<Exception, List<ProvinceModel>>> call() {
    return _repo.fetchProvinces();
  }
}
