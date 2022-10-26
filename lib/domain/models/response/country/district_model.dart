import 'package:chomoi/data/dto/response/country/district_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'district_model.freezed.dart';

@freezed
class DistrictModel with _$DistrictModel {
  factory DistrictModel({
    required String districtId,
    required String districtName,
  }) = _DistrictModel;

  factory DistrictModel.empty() => DistrictModel(
        districtId: '',
        districtName: '',
      );

  static List<DistrictModel> fromDto(DistrictDto dto) {
    return List<DistrictModel>.from(
      dto.results.map<DistrictModel>(
        (e) => DistrictModel(
          districtId: e.districtId,
          districtName: e.districtName,
        ),
      ),
    );
  }
}
