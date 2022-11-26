import 'package:chomoi/domain/models/response/country/district_model.dart';
import 'package:chomoi/domain/models/response/country/province_model.dart';
import 'package:chomoi/domain/models/response/country/ward_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CountryRepository {
  Future<Either<DioError, List<ProvinceModel>>> fetchProvinces();

  Future<Either<DioError, List<DistrictModel>>> fetchDistricts({required int provinceId});

  Future<Either<DioError, List<WardModel>>> fetchWards({required int districtId});
}
