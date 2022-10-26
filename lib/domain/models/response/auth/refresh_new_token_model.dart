import 'package:chomoi/data/dto/response/auth/refresh_new_token_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_new_token_model.freezed.dart';

@freezed
class RefreshNewTokenModel with _$RefreshNewTokenModel {
  factory RefreshNewTokenModel({
    required String idToken,
  }) = _RefreshNewTokenModel;

  factory RefreshNewTokenModel.empty() => RefreshNewTokenModel(
    idToken: '',
  );

  factory RefreshNewTokenModel.fromDto(RefreshNewTokenDto dto) {
    return RefreshNewTokenModel(
      idToken: dto.data
    );
  }
}
