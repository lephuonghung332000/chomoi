import 'package:json_annotation/json_annotation.dart';

part 'ward_dto.g.dart';

@JsonSerializable()
class WardDto {
  WardDto({
    required this.results,
  });

  List<Result> results;

  factory WardDto.fromJson(Map<String, dynamic> json) =>
      _$WardDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WardDtoToJson(this);
}

@JsonSerializable()
class Result {
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Result({
    required this.wardId,
    required this.wardName,
  });

  @JsonKey(name: 'ward_id')
  String wardId;
  @JsonKey(name: 'ward_name')
  String wardName;

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
