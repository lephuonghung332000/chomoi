import 'package:json_annotation/json_annotation.dart';

part 'province_dto.g.dart';

@JsonSerializable()
class ProvinceDto {
  ProvinceDto({
    required this.results,
  });

  List<Result> results;

  factory ProvinceDto.fromJson(Map<String, dynamic> json) =>
      _$ProvinceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceDtoToJson(this);
}

@JsonSerializable()
class Result {
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Result({
    required this.provinceId,
    required this.provinceName,
    required this.provinceType,
  });

  @JsonKey(name: 'province_id')
  String provinceId;
  @JsonKey(name: 'province_name')
  String provinceName;
  @JsonKey(name: 'province_type')
  String provinceType;

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
