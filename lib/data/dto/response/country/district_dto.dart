import 'package:json_annotation/json_annotation.dart';

part 'district_dto.g.dart';

@JsonSerializable()
class DistrictDto {
  DistrictDto({
    required this.results,
  });

  List<Result> results;

  factory DistrictDto.fromJson(Map<String, dynamic> json) =>
      _$DistrictDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictDtoToJson(this);
}

@JsonSerializable()
class Result {
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Result({
    required this.districtId,
    required this.districtName,
  });

  @JsonKey(name: 'district_id')
  String districtId;
  @JsonKey(name: 'district_name')
  String districtName;

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

