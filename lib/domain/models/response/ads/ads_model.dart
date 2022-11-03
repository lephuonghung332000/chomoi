import 'package:chomoi/data/dto/response/ads/ads_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ads_model.freezed.dart';

@freezed
class AdsModel with _$AdsModel {
  factory AdsModel({
    required String id,
    required String image,
    required String title,
    required String content,
    required String url,
  }) = _AdsModel;

  factory AdsModel.empty() => AdsModel(
        id: '',
        url: '',
        image: '',
        content: '',
        title: '',
      );

  static List<AdsModel> fromDto(AdsDto dto) {
    return List<AdsModel>.from(
      dto.data.map<AdsModel>(
        (e) => AdsModel(
          id: e.id,
          image: e.image,
          url: e.url,
          content: e.content,
          title: e.title,
        ),
      ),
    );
  }
}
