import 'package:chomoi/domain/models/request/comment/comment_request_model.dart';
import 'package:chomoi/domain/models/request/search/search_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_request_dto.g.dart';

@JsonSerializable()
class SearchRequestDto {
  @JsonKey(name: 'key')
  final String? key;
  @JsonKey(name: 'user_id')
  final String? userId;

  SearchRequestDto({
    required this.key,
    required this.userId,
  });

  factory SearchRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestDtoFromJson(json);

  factory SearchRequestDto.fromModel(SearchRequestModel model) {
    return SearchRequestDto(
      key: model.key,
      userId: model.userId,
    );
  }

  Map<String, dynamic> toJson() => _$SearchRequestDtoToJson(this);
}
