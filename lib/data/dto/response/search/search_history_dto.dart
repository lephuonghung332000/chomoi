import 'package:json_annotation/json_annotation.dart';

part 'search_history_dto.g.dart';

@JsonSerializable()
class SearchHistoryDto {
  SearchHistoryDto({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final List<SearchHistoryData> data;

  factory SearchHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchHistoryDtoToJson(this);
}

@JsonSerializable()
class SearchHistoryData {
  factory SearchHistoryData.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryDataFromJson(json);

  SearchHistoryData({
    required this.id,
    required this.userId,
    required this.key,
    required this.createAt,
  });

  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'create_at')
  final double createAt;
  final String key;

  Map<String, dynamic> toJson() => _$SearchHistoryDataToJson(this);
}
