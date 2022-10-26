import 'package:chomoi/data/dto/response/country/district_dto.dart';
import 'package:chomoi/data/dto/response/country/province_dto.dart';
import 'package:chomoi/data/dto/response/country/ward_dto.dart';
import 'package:chomoi/data/providers/network/apis/country_api.dart';
import 'package:chomoi/domain/models/response/country/district_model.dart';
import 'package:chomoi/domain/models/response/country/province_model.dart';
import 'package:chomoi/domain/models/response/country/ward_model.dart';
import 'package:chomoi/domain/repositories/country/country_repository.dart';
import 'package:dartz/dartz.dart';

class CountryRepositoryImpl extends CountryRepository {

  @override
  Future<Either<Exception, List<DistrictModel>>> fetchDistricts(
          {required int provinceId}) =>
      Task(
        () => CountryAPI.fetchDistrict(provinceId).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (response) => DistrictModel.fromDto(
                DistrictDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<Exception, List<ProvinceModel>>> fetchProvinces() => Task(
        () => CountryAPI.fetchProvince().request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (response) => ProvinceModel.fromDto(
                ProvinceDto.fromJson(response),
              ),
            ),
          )
          .run();

  @override
  Future<Either<Exception, List<WardModel>>> fetchWards(
          {required int districtId}) =>
      Task(
        () => CountryAPI.fetchWard(districtId).request(),
      )
          .attempt()
          .map(
            (either) => either.leftMap<Exception>(
              (l) {
                return l as Exception;
              },
            ).map(
              (response) => WardModel.fromDto(
                WardDto.fromJson(response),
              ),
            ),
          )
          .run();
}
