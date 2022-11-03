import 'package:chomoi/data/dto/response/country/province_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'province_model.freezed.dart';

@freezed
class ProvinceModel with _$ProvinceModel {
  factory ProvinceModel({
    required String provinceId,
    required String provinceName,
    required String provinceType,
  }) = _ProvinceModel;

  static List<ProvinceModel> fromDto(ProvinceDto dto) {
    return List<ProvinceModel>.from(
      dto.results.map<ProvinceModel>(
        (e) => ProvinceModel(
          provinceId: e.provinceId,
          provinceType: e.provinceType,
          provinceName: e.provinceName,
        ),
      ),
    );
  }
}
