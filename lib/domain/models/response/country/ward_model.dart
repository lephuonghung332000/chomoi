import 'package:chomoi/data/dto/response/country/ward_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ward_model.freezed.dart';

@freezed
class WardModel with _$WardModel {
  factory WardModel({
    required String wardId,
    required String wardName,
  }) = _WardModel;

  static List<WardModel> fromDto(WardDto dto) {
    return List<WardModel>.from(
      dto.results.map<WardModel>(
        (e) => WardModel(
          wardId: e.wardId,
          wardName: e.wardName,
        ),
      ),
    );
  }
}
