import 'package:chomoi/domain/models/response/country/district_model.dart';
import 'package:chomoi/domain/models/response/country/province_model.dart';
import 'package:chomoi/domain/models/response/country/ward_model.dart';
import 'package:dartz/dartz.dart';

abstract class CountryRepository {
  Future<Either<Exception, List<ProvinceModel>>> fetchProvinces();

  Future<Either<Exception, List<DistrictModel>>> fetchDistricts({required int provinceId});

  Future<Either<Exception, List<WardModel>>> fetchWards({required int districtId});
}
