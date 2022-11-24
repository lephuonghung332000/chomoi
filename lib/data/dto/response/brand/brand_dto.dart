import 'package:json_annotation/json_annotation.dart';

part 'brand_dto.g.dart';

@JsonSerializable()
class BrandDto {
  BrandDto({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final List<BrandData> data;

  factory BrandDto.fromJson(Map<String, dynamic> json) => _$BrandDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BrandDtoToJson(this);
}

@JsonSerializable()
class BrandData {
  factory BrandData.fromJson(Map<String, dynamic> json) => _$BrandDataFromJson(json);

  BrandData({
    required this.id,
    required this.name,
    required this.image,
  });

  final String id;
  final String name;
  final String image;

  Map<String, dynamic> toJson() => _$BrandDataToJson(this);
}
