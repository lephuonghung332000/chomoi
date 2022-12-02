import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_token_request_model.freezed.dart';

@freezed
class FcmTokenRequestModel with _$FcmTokenRequestModel {
  factory FcmTokenRequestModel({
    required String token,
  }) = _FcmTokenRequestModel;

  factory FcmTokenRequestModel.empty() => FcmTokenRequestModel(
        token: '',
      );
}
