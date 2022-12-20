import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_request_model.freezed.dart';

@freezed
class ChatRequestModel with _$ChatRequestModel {
  factory ChatRequestModel({
    required String idReceiver,
    required String postId,
    required String idSender,
  }) = _ChatRequestModel;

  factory ChatRequestModel.empty() => ChatRequestModel(
    postId: '',
    idSender: '',
    idReceiver: '',
  );
}
