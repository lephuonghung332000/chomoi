import 'package:chomoi/data/dto/response/brand/brand_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_model.freezed.dart';

@freezed
class BrandModel with _$BrandModel {
  factory BrandModel({
    required String id,
    required String name,
    required String image,
  }) = _BrandModel;

  factory BrandModel.empty() =>
      BrandModel(id: '', name: '', image: '',);

  static List<BrandModel> fromDto(BrandDto dto) {
    return List<BrandModel>.from(
      dto.data.map<BrandModel>(
        (e) => BrandModel(
          id: e.id,
          name: e.name,
          image: e.image,
        ),
      ),
    );
  }
}
