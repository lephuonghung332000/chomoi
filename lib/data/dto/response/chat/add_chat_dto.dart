import 'package:json_annotation/json_annotation.dart';

part 'add_chat_dto.g.dart';

@JsonSerializable()
class AddChatDto {
  AddChatDto({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final String data;

  factory AddChatDto.fromJson(Map<String, dynamic> json) =>
      _$AddChatDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddChatDtoToJson(this);
}