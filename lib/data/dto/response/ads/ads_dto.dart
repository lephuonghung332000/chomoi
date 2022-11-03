import 'package:json_annotation/json_annotation.dart';

part 'ads_dto.g.dart';

@JsonSerializable()
class AdsDto {
  AdsDto({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final List<AdsData> data;

  factory AdsDto.fromJson(Map<String, dynamic> json) => _$AdsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AdsDtoToJson(this);
}

@JsonSerializable()
class AdsData {
  factory AdsData.fromJson(Map<String, dynamic> json) => _$AdsDataFromJson(json);

  AdsData({
    required this.id,
    required this.image,
    required this.title,
    required this.content,
    required this.url,
  });

  final String id;
  final String image;
  final String title;
  final String content;
  final String url;

  Map<String, dynamic> toJson() => _$AdsDataToJson(this);
}
