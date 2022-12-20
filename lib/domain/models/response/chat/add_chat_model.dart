import 'package:chomoi/data/dto/response/chat/add_chat_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_chat_model.freezed.dart';

@freezed
class AddChatModel with _$AddChatModel {
  factory AddChatModel({
    required String id,
  }) = _AddChatModel;

  factory AddChatModel.empty() => AddChatModel(
        id: '',
      );

  factory AddChatModel.fromDto(AddChatDto dto) {
    return AddChatModel(id: dto.data);
  }
}
