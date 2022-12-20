import 'package:chomoi/data/dto/response/auth/sign_up_information_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_information_model.freezed.dart';

@freezed
class SignUpInformationModel with _$SignUpInformationModel {
  factory SignUpInformationModel({
    required String idToken,
    required String userId,
  }) = _SignUpInformationModel;

  factory SignUpInformationModel.empty() => SignUpInformationModel(
        idToken: '',
        userId: '',
      );

  factory SignUpInformationModel.fromDto(SignUpInformationDto dto) {
    return SignUpInformationModel(
      idToken: dto.data.token,
      userId: dto.data.id,
    );
  }
}
