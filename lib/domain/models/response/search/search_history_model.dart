import 'package:chomoi/data/dto/response/search/search_history_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_history_model.freezed.dart';

@freezed
class SearchHistoryModel with _$SearchHistoryModel {
  factory SearchHistoryModel({
    required String id,
    required String userId,
    required double createAt,
    required String key,
  }) = _SearchHistoryModel;

  factory SearchHistoryModel.empty() => SearchHistoryModel(
        id: '',
        userId: '',
        createAt: -1,
        key: ''
      );

  static List<SearchHistoryModel> fromDto(SearchHistoryDto dto) {
    return List<SearchHistoryModel>.from(
      dto.data.map<SearchHistoryModel>(
        (e) => SearchHistoryModel(
          createAt: e.createAt,
          id: e.id,
          userId: e.userId,
          key: e.key,
        ),
      ),
    );
  }
}
